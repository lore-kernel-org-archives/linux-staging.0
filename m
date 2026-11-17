Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937709;
	b=00W4BqEKPateHSj09doM7iQXh41n4kT2YfJvsnP2MCUBlc+ZK0h4deEeVvJ4pjlksMdK
	 0G+btlse1uq63IpN3fIDVrzVGy6+CYNOZ4Xno7xq04MvAUbIFKV+pmFlyFfJWpiGr6BUu
	 en5fPI6upLdk0IlAtaF8JwH/DOSvK6Xobzxaw3woJj/tUg9vcIqtFdGRG5TiK79mvhoAL
	 Zy1Svr4Kk6VK1tlbrzuGySVItPS6NkRz9MAhAwLAaCphRO/EEUZJjQQ7pIoLrChJTfEqR
	 mjFnxN8pAllNz4I2XgN/c1pyxpkemA8gTjeW+A7iKpLy6r0EMk191gc27NazUA/4tnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Vgnwr2P9uJ+QpfiPOUlt8DPsw41jue0qV/UrisGiK9Q=;
	b=qr5FC9jX2dZ+F1pqE+9Jg+Z9Xjmc3nty0yOr2PFRBbqeYVuLliIosv+Ks8oAPiacI72j
	 ph3ahA9xmQ6lI8Bmzjp0giHOpZm8czBCx9WeYyDcxrXp3Be7iCX4tY2N7oGtsKYIovSM+
	 WsM8nhbhvKFR7QGpgDvhhIsfGn1EOUKhqWFEZ2R/8YfA7WpOPvEnSlA6rUalVg0zfMYXy
	 seYEz34lsI0jWpaj3won2dzaU8a+tUR5jm0RFhR8IJJ5iV23wLvDutUmJKGQDhNs7WBRB
	 tZMnIVj/CMY3+473qFhbeavj/47r3sty6JGSd4F6yC0unWBs5Ivvbh/B5ck8jP5iXjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L9cugbBa;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437A1606A333
	for <linux-staging@lists.linux.dev>; Tue, 17 Nov 2026 17:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 437A1606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L9cugbBa
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a42b34e930so21935f8f.2
        for <linux-staging@lists.linux.dev>; Tue, 17 Nov 2026 09:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937707; x=1795542507; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vgnwr2P9uJ+QpfiPOUlt8DPsw41jue0qV/UrisGiK9Q=;
        b=L9cugbBaKikuX+vV8XClIDOtQ6q9SCSg30sxhHvQwao6DKiUTBG20MVdysKQvCpPoc
         om2/bZWNlQJ8CCxe80SYDffTgFNQEeT/ktkYo1G3JI3JYUBEbX97jVLkwzk4CyikST+k
         1znEsxZAIUqIkg82foOq5NyPyzm3VfHFX+/KoqP2q/70v64YmBTWJt/zh92sXIxawODr
         NMdBRHuL8FeG7MSx7QAybhyXJSevr/QHY119R1X8R2KNpSLROAdckQomM3AXOjrSfp+Y
         HlA36Ug+8fGQfeJKH2711/xRMQolwsCeWdT1PjV3wwdpdUg+YrKpHnBY1hfS97pVE5RI
         u+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937707; x=1795542507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vgnwr2P9uJ+QpfiPOUlt8DPsw41jue0qV/UrisGiK9Q=;
        b=UdEzE6UGPuydWQxOMvLkyyU7JDvKFzu5WGhXjb7Mw5U5Yy3+yaq6m4IQTpE83gxKJe
         4PWUUZSk3/hPeD8pw52wmaSKuWILqr9DA0GeSKyTrrYz813Lv36l8RTWbqwDRD0NPBcL
         LV7MCWv5BRvOQY6zUPxbbmcA9frrNdxHdcSrmqKIbY72IjwkC2y2L06sPAUr+Wbaf74U
         onkD+VjqW2hdI95Gx/UbR0u5G++9BcyDvTT8X55L8NcoszwmdYYyT0bg05hIV893f4Ui
         UduDggeOD9+1kZ7ht/6R7WUWLQBQfe/vxdzHdF0zGghJZGCpaXQojQ7orzJElzb55YYv
         0ewg==
X-Forwarded-Encrypted: i=1; AL+hErEY/jjCsHYAiSRseVFyjEZP0P+nAnEVOUaoo9dy1IweOXvrdQPHMetqgwz9kc+S4l2H/mzG2aNQaUcrJJfZ@lists.linux.dev
X-Gm-Message-State: APuU4Z/gdH9ilOkV6Gv1WiJKcvfL1SjYsfN0/GVwJUyHBoONMXNuBMF5
	rTW+zKfzWgkLW6YASPSvVMERW1Y0tmfw5E+IV73VakPOGwHG88BRD8sz
X-Gm-Gg: AYBFou2qY2GIR/okEC24bOMUNW1LV0rpy4r2XnFfZe+ZMFlLWSHvVS6kQSqODbqMD0I
	st14B3yIEIYRiQBNZo5p1nSstBIlNN5Yzrj+AA8KgeKVgOxNICfIjtMNCWOj5INTiFieOV1kbTS
	X2OTagwE+QvonXqPS47LdjzES5hM33AF+lZx/NMQ0u5q3p2UHTUfQCpBsmvAgyJSVNnZD72R5y+
	H2FkRRARefyp7iR5hhMAeAkVTXPYN3Z6AvjPovRvYhL+wrQZA7aa7H7G3HJYgjQWzefoaOTGKm9
	tIed6oEJHM2lzoXDX/8BegX4u7L36+7jCYqIs2Y5WgTUJP2dobyCLNnFLzLzRzgPGqsct6xpSHt
	6GRDiPwPDm+7I5bMRjwKb+OYFNFxLv+HvZ559EwcBv1g/6cvfRhVe/euymQ9ckYxQ2yEGb33155
	jJbO4xzkGr4LK/KLUCL0Da33i+jRgCoj0OMSr9DFW7WgY/2z9m2BeOCX+oqXHeAO4r0eqSubu57
	72tPDiPqtT/9yH0K3ChXw3JlZfl/kI05llIT51mAxWo4u9ILikiPKgTAho7bkNRP6EyJG9L1R3j
	kVe+UybvQ9yKBMGFYZd/2DMJ31SqP3sJXmSF3KPXxDAb9Xs=
X-Received: by 2002:a05:600c:8483:b0:4bb:605d:8e92 with SMTP id 5b1f17b1804b1-4bb605d90f1mr250423555e9.32.1794937707327;
        Tue, 17 Nov 2026 09:48:27 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:11a1:dc8c:1ed6:51c5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d287f92sm413055e9.0.2026.11.17.09.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:48:26 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: mlevif@gmail.com
Cc: andy@kernel.org,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Re: [PATCH] media: atomisp: csi2-bridge: Only change the PMC clock rate when needed
Date: Tue, 17 Nov 2026 17:47:35 +0000
Message-ID: <20261117174735.10182-1-volodymyrchapman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112-atomisp-pmc-clk-rate-v1-1-d6b3ef392ccf@gmail.com>
References: <20261112-atomisp-pmc-clk-rate-v1-1-d6b3ef392ccf@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Manuel,

On Thu, Nov 12, 2026 at 03:39:29PM +0000, Manuel Levi wrote:
> atomisp_csi2_set_pmc_clk_freq() enables and then disables the sensor's
> PMC platform clock before setting its rate to 19.2 MHz, which leaves the
> clock forced off in hardware.
[...]
> The enable/disable sequence is only needed to change the rate, which can
> default to 25 MHz on Bay Trail. On Cherry Trail the clocks already run at
> 19.2 MHz. Skip the sequence when the clock already has the right rate,
> so that the bridge leaves the clock state to ACPI.
[...]
> +	if (clk_get_rate(clk) == PMC_CLK_RATE_19_2MHZ) {
> +		clk_put(clk);
> +		return 0;
> +	}

I ran into the same problem independently on a Lenovo ThinkPad 10
(20C3, Bay Trail, Atom Z3795) with an IMX175 rear sensor (INTCF1A,
driver pending on linux-media) and an OV2722 front sensor, and sent the
same change, which I have now dropped in favour of yours.

I tested this patch as posted, with the atomisp driver built out of tree
against a 7.2.15 kernel, over 10 boots (7 reboots and 3 power-offs).
Both sensors were registered on every boot, with no chip ID read errors.

On this Bay Trail machine the clocks used by the sensors are already at
19.2 MHz after boot: the DSDT lists CLK0 in the IMX175's _PR0 and CLK1
in the OV2722's _PR0. pmc_plt_clk_0 and pmc_plt_clk_1 report 19.2
MHz, while the unused pmc_plt_clk_2, 4 and 5 report 25 MHz. I read these
after the bridge had run, so they don't show on their own that the
skip path was taken. Together with your clock trace results, it
looks consistent.

Tested-by: Volodymyr Chapman <volodymyrchapman@gmail.com> # Lenovo ThinkPad 10 (20C3)

Thanks,
Volodymyr
