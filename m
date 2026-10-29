Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300351;
	b=a6Eo6OxgT5Bs7EcJCE/L5n1RNlPqATj3EL54sUCLeOq4C7DqsdIs+JuUiYE2rymhhtDk
	 TW90bKjXGaSg5RxokgfFzaZpz2Xh89sSlL3oos9Fut9bYpxSpblPxtMVl6XhcJnMEtsMc
	 clIndVwhXT2ieH8I3Yl0SYfCxoPwJ63eTiRszFVVw2/lQdkvhng7WGdJkAc+e00Jqe4tN
	 hE/DHe2nG6GbD/g8B3yB2WKGhJP/u4ZdZTpvl5oJtYwZG1x0GP7b1kJatQDMC9I8e+Q+4
	 UqXwuvoTlEZAfVKS+GFv2vdSJTsuOreU/vqz0YcqflJ7x+F64q0iN28vnhXDrC7ieVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=K0Ytmrnk1GXIgM1fqIrHZ5HsCVM2IH42icX0Nl0p4uM=;
	b=A7LvLDMwQmzV/6eGCaI+rh5PFapJFIJ5dn3iyAU1pUrEql3CP3jOBLOttlkquqH9KXZg
	 bAOo2XK5Z8Ods/Zm7daRNUkVu4Q/Lfu/8SxwIk4Zy1VTiaDpGtW5MhZ0I4MmUIYZgi82C
	 HGtm0N32tmC2QFN4JoC2MJi+3ZrYSGmkirWVr6gOkX+bKcgXUXxrqHVFnUbItNn/Xy8yx
	 MA8wW9A6ddgqUgtceabh8WISJwWmwY3a9aUQfvYe6JvStuP3IUSpg6DYMnjQYOc+KITo5
	 lf26V3SmqwSrZI7B8kECSVfgmsTdY50JCo7NFc+Gzx2sbkVb/gTkOHs5nK6c42W5H7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n9Vivb5T;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E953D606A32A
	for <linux-staging@lists.linux.dev>; Thu, 29 Oct 2026 18:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E953D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n9Vivb5T
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so16224995e9.3
        for <linux-staging@lists.linux.dev>; Thu, 29 Oct 2026 11:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793300349; x=1793905149; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K0Ytmrnk1GXIgM1fqIrHZ5HsCVM2IH42icX0Nl0p4uM=;
        b=n9Vivb5TqpsSyppk6cFWW+1D31ir1UyzZpBK7DVSRRChQLLaDj31UlBbNKx4YmWXag
         zVhyfGXJPH+MzNLrU+mvz+ENl3bIjy/90SAvNWgNhkrBVwEvyG8vIAIx3UPabgO0ZtCF
         ZRyH3umxTrS+VkQXUxVvWPZIPfKSWRFwu1dTt13Rj0cby9fCf5XCNBBPLcWGetGiWhc3
         6F+xzB2w2OZ2k5ca07PTeNGvImsviLMMbUzVnHjVp0ryII+FiHdg9e7xBxuZe8lEriln
         sooL3S6eGLjAekJY4vYbjolm+Pvn7suKQndQusP8EWjwsAZ1xE74xGLP7+JZOW+nc2Xn
         WlGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300349; x=1793905149;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K0Ytmrnk1GXIgM1fqIrHZ5HsCVM2IH42icX0Nl0p4uM=;
        b=yBrSF6ClZBg9GDzPPSX9bicTrd9Y9gNOn5hO3hdhLRDRDNiZKlUSbik1ng++9PPquC
         dVrNzG/ZcOGkGeo3Q6OiLy49SU5sKAMwWgY+dkppy428TgB1T/wBUnirZg3w2fwTudTZ
         SrkWMFAtQvDCdrIEPU4faCNm/vbgHW1j4THSs9MMpMlqkkaJJRhWvbnbvbzX+FoMQhHb
         ZQWta+5df/IbiBp6Vq5dsWjKHWTM+gWQjdjFmZHKSvVbe5iUyQCkIzzn/mT2WASM+DON
         DsCu9d6mWHD0TDvWn5kkaoPFSswMm8KZdZLIZ4uvrG9xF1rXsaLvCaacvC3t4KMmOH4l
         pVXg==
X-Forwarded-Encrypted: i=1; AKwUvBzbW5GYM5QlJye70Au2U/oORRXlcUhikFNspUhEZuOSYSTm4f6xH3GkfHJyupmC+zbwkVrnOzaAHdHXuq96@lists.linux.dev
X-Gm-Message-State: AFq9FYKN3XM0Q9AgqZ+tI+J60V0+OTF6EkyyAK0QS/EkzXn83wJe7iaP
	Gv9CZDyOzKUOiJyHuHe/pHyCjAj1V10LmaPhgP3KC6cWHEHQXyVBOVN8
X-Gm-Gg: AYBFou0Vr6h1tnD+ehNfrDnlO4ozmA/vILHfDkqcuHkhQKhzocVYEE8lEGrF4sPOG6+
	DFg4PbCt+iaOEo6LDSK9wGd28kPpjt2bnU9CVMbwNJ8hRFZp2TBjtcKCAr94esNrShdWjYeTVY8
	NihDWxK/ZhbHnLhAy+v8coUnnzFqUWBkxfDFbXwxtX+2lSns/7/iimyAbJTtlmAakfUi/39L9d/
	rURCzeoC9AbemNTp8c9UZRC7gsbBra+4t8oRx5WT5VM7aQkJmO3DnHY9Y5zElBWHrVppug+1bwh
	MaNwfy0gozYKiSjYzRleTA0ZZXJBkx6Phs/GVNqhgGi9gTOOffK/C7xDOIKB7FvVuOIGboLSXgV
	+OTsjDh3MAUjhs82rX8IdvvcW6DKaAPu3LLrYYXaI2Y4cQdH6pbAvR2Qk/BiidIi97ogUXpwoil
	j8b1Exf4pjRJEwmevAfi72t/LdUxis88ubFK1tUj5KAMocfK3cM7ktnRKGFfunKeO59cMCdvgbX
	0NyOtoiNvHzplrRv/za3mhXwvw5UY9zBljUX3/v5FJINphm1Q2gsW1WXnogJIThwhbBNJt2B2uN
	42wZYbTkL22ZmpyIW8AvlEOGU6aw9OUXFEue33g9AvAJo4Iqb41NOeMMEZOIhUYw0MUkejnMl1+
	ZaKiKSp4fCWJy/H46u8V+BFkKYnVKqdcmZ8J0afQx2NRvmYXYiuLYqLR6rhc0wSZCtAh3PH/YlO
	Lny2qlZdGIOiow
X-Received: by 2002:a05:600d:4121:b0:4a3:59c9:a758 with SMTP id 5b1f17b1804b1-4a96836988amr152798385e9.32.1793300349381;
        Thu, 29 Oct 2026 11:59:09 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6c76507sm4933955e9.10.2026.10.29.11.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:59:08 -0700 (PDT)
Date: Thu, 29 Oct 2026 21:59:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
	Karol Wachowski <karol.wachowski@linux.intel.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Alex Elder <elder@kernel.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Guan-Yu Lin <guanyulin@google.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, netdev@vger.kernel.org,
	imx@lists.linux.dev, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/1] PM: runtime: change stub pm_runtime_get_if_active()
 return 1 when !CONFIG_PM
Message-ID: <auOXeGVQG0UHeoQb@stanley.mountain>
References: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>

On Thu, Oct 29, 2026 at 12:30:37PM -0400, Frank.Li@oss.nxp.com wrote:

> Pattern C: ret > 0 / ret <= 0 / ret != 1 checks -- FIXED
>   drivers/usb/core/offload.c: checks (!= 1), old -EINVAL caused
>     -EBUSY even with !CONFIG_PM. Fixed: now returns 1, proceeds.
>   drivers/accel/ivpu/ivpu_job.c: drm_WARN_ON(<= 0), old -EINVAL
>     spuriously triggered WARN. Fixed: 1 > 0, no warn.
>   drivers/gpu/drm/i915/intel_runtime_pm.c: checks (<= 0), old
>     -EINVAL triggered error path. Fixed: 1 > 0, correct path.
>   drivers/accel/ivpu/ivpu_sysfs.c: (> 0), old skipped freq read.
>     Fixed: proceeds correctly without CONFIG_PM.
>   drivers/gpu/drm/xe/xe_pm.c: wraps (> 0), all xe callers
>     (xe_bo.c, xe_shrinker.c, xe_vsec.c, xe_ggtt.c, xe_guc_ct.c,
>     xe_pxp.c) now correctly treat !CONFIG_PM as active.
>   drivers/net/ipa/ipa_smp2p.c: power_on = (> 0), now correctly true.
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c: (> 0), now correctly
>     executes stall register update.
>   drivers/staging/media/ipu7/ipu7-buttress.c: active (<= 0) early
>     return now skipped, correctly proceeds.

Pattern C is mostly bugs so this patch should have a Fixes tag since
it fixes bugs.

regards,
dan carpenter


