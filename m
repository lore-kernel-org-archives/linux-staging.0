Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982DB3ACF00
	for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 21:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003518; cv=none; b=mG7fMsX57fJ+OVApc+x8uB+q2/PQHojNsZNsG4KjvdlQBm7Nm1JIHjxSlNPtJoL7hMiaPydOccR3NjSn06B7W8EhyWjYvvXgaYoQ/vylH7Ehj9wDhqqT1LqzgNfSjFZlXk3e7Mqs4oisGQOV6rh5nffvNZ2iUw7DoJFUl1bvE2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003518; c=relaxed/simple;
	bh=1OUwH3vpefuJTu+Cf5X1NgO2KYMRYxDAo1MiyQly/Go=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Cw3VEGiEGhRkD3LWPklPjnqq3BLWQgii96tTrWLge4ibLIo7WcOsY+xPh2B+I0pdmyNU3KFu2zjlKwlR/Gj8z2cuaVYv49F1X3TuPY7XKY/1yWs6BwW9CT/BFhFaVaHipmXd+wq9X24/NRusuk2v55NrxR/7Oju22dyb63ID+U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfDH1snH; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfDH1snH"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso50107635e9.1
        for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 14:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787003513; x=1787608313; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1OUwH3vpefuJTu+Cf5X1NgO2KYMRYxDAo1MiyQly/Go=;
        b=AfDH1snHD93cGZ1A1a3NetLE9ffBErnqdWrkqUVf7fyy0oIOOMB+o11ITGhELg+XUZ
         6waSycVNq5JTbB4q7eff44U4swf9xSqBSxguvw1aw2VnsY7rXSTsxvprmfhqTez59WUQ
         OSdwrCcQ/3XLMHH/EUcXuFF8ni+DVxkEgLoQ/e+a7CdrKfOcvlCP3ymg1zG7Zn/FR1ZA
         mGUiDHv7yHmErbWLPSYs3o3MznESm5cVBkF0PGSgmANu/pQoli6WuRYFef+vKhiHyj0R
         1V6P+dOEa9Em+eOE6VAAEDi6xGUEm2f6zItdwhklJ9JxEeq3lgNuP4t2fTyHz9Uw1I8w
         LmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003513; x=1787608313;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1OUwH3vpefuJTu+Cf5X1NgO2KYMRYxDAo1MiyQly/Go=;
        b=YQ3d7AnrxWzK43Iwg6wcJXCyHgk/kUmbquA8+hlCCGaGT1jWiT8JkwjQb0Ii8DfwRs
         ers0d/A78GCbh6Ez1pHGgwbKl+Uv8bkIEOmn4fP5W48TdsuVappaQ0ZW/PWpKzDVfCXU
         h7HoHe5dMdCVfzCU5mtu4IWl86Rsf5NluCWbjxgVzPNYxwhr7H3Tfo5cqHReHw2ojH1P
         DC4yjoipnxVa3dkYnQJ88kwXzP0vp7DwtoP/HV3HYdOU62GXxQf5oopvE1R7TKFnjR7q
         KqGWDwhBrsR/dfgz6gxxd+ygzGg1U+CcMFuk5/Exq3xTXZmrw0OD65EGdnTDnwGcVIkT
         YQIQ==
X-Forwarded-Encrypted: i=1; AHgh+RqeZuHg7+euSyWOxVS0eH8PNpMWmC4J7i5Ys0G2qrmfK9mt29ypSCloMAxSKKnObM74T9L3lQk2z6AUq7+v@lists.linux.dev
X-Gm-Message-State: AOJu0YyuQoaUqLCQqkT5/eddZPrNi4Hq+UA8JAi0F27V6RvUj7bKq7th
	ZonKPP3hlAxAVl2gXmk2U3uqbn8eJgTjbbAisNKDTY2IaZQB5Ydh2ppx
X-Gm-Gg: AR+sD116yBKCvgKdqMyT3WW6fMgZB0rCuLif4RksaTVzIgYysFzeqxawcMApyk5y9qe
	Fe98+zWMjWkV+aXqGGoZsr/aLlznxj4gXjqRcdls6mUKslJ/LtCwkF7rqeOJzFcwFxoggz3sOFU
	6xll8qywPRWkwrBZQk3zI1xSUQLYvyH/fiZHVm4e8qPJhJz6vyN2RJ0395s1YV2hziPYGHTg01/
	QbUpYUqfyuAsIwBRC4aPA80QHHZyhgw1KVOuMDLaZ0EwTSvA6KjveT7JRszaBhPbtiXDo6aCfoF
	z69OtaVnsUBKCZSrcZTMYc9dzqzOcTnzu7sbp64fMSQ7TIsFZEVcJ0lhACd67lVmVuaeLVZ0S5w
	KGCg66FWvFv/W9vD7+1zYqYybxvtIJEP5FnJsh5l2inmf7McHkDA3SEFHa7oYLwmiMNVvBlV1/u
	O8hAJjOaBoEXg3gEUCnuX6iWaf/OCzGpgk0TnG9XzjerKWfR5VgAxRpUs7zdHF6ddhX3HpEYRT7
	VnLxmqduPLCQ/QSbduluZPnGETlo/r1vY/XfuKPteelprAKlCVNqCetjmlPhD1etlU=
X-Received: by 2002:a05:600c:1546:b0:499:484a:98e7 with SMTP id 5b1f17b1804b1-49987974700mr415672585e9.14.1787003512692;
        Mon, 17 Aug 2026 14:51:52 -0700 (PDT)
Received: from localhost (178.43.142.119.ipv4.supernova.orange.pl. [178.43.142.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a31572sm7076978f8f.5.2026.08.17.14.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:51:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Aug 2026 23:41:07 +0200
Message-Id: <DKRJNC8R41H4.1TJ6IRW0XR5XP@gmail.com>
Cc: <mitrutzceclan@gmail.com>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 "Martin Hecht" <Martin.Hecht@avnet.eu>, "Andrian Suciu"
 <Adrian.Suciu@analog.com>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Cosmin Tanislav"
 <demonsingur@gmail.com>, "Vivekananda Dayananda" <vivekana@amd.com>, "Cory
 Keitz" <ckeitz@amazon.com>
Subject: Re: [PATCH v15 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
From: "Artur Andrzejczak" <andrzejczak.artur@gmail.com>
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Julien Massot"
 <julien.massot@collabora.com>, "Rob Herring" <robh@kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0
References: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
In-Reply-To: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>

On Fri Aug 7, 2026 at 3:02 PM CEST, Dumitru Ceclan wrote:
> [...]

Thanks for the patches, good to see the GMSL support integrated into a
common framework.

Small note: patch 16 adds a second config VIDEO_MAX96717 and a second
max96717.o. The old driver is only removed in patch 21. One symbol then
builds two max96717.o objects, which scripts/modules-check.sh rejects.
Won't allmodconfig bisection be broken for patches 16..20? Both drivers
also match maxim,max96717f in that window. The same overlap exists for
maxim,max96712 (staging driver vs the new max96724 one, patches 17..19)
and maxim,max96714f (18..21), where probing becomes order-dependent. Can
the removals be reordered so that these windows close?

Kind Regards,
Artur Andrzejczak
