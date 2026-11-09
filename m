Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246680;
	b=0u6jaGxdauzqi2MW8xB08Akh3m+u1mKe9FV+eliKPMSG5k07T3BG4Jk4eUmAV8+oQn1E
	 mEcFCck7wizbb0cgwzXuhVdm3D38hrIwl/kyDULNgcBOSe9J+He/UhmLZMED1gDcYdaAE
	 nVEqgjcIJeToZRm9dMbK8Xa1dVkBFxGUuJrYoEUk55/huKECuf8lJEizM4T8hf64plRjl
	 mUEif4sGSi58CCXKX45zQ3EYeywpdGSI1bLAx96X6bj06bi8ZgjPI2Z1ky6s4/K0leByi
	 /JBouli//BnwE/NZWts8wpWnoXl7vKNLFjvFd4JcFCZBJdfsglUri7ZIZbQ6WVrBmLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aNMBR4KqypyM8nZC0Zd6F06XAJ3Q0+V3qNyKzqi9O44=;
	b=mrvFhrxAnUqLhDdu3bR4lpmEyeucJ9ZrxDhr693zb3/2Xb3Xxgt18P1peue7AOa2FXqF
	 98/VF6O8se8nqwKy3w+zMKRkZDxZrRCh6HsQMYJO5xusVQ1EaVCzu0WGcUE1gKinEkWL0
	 nqQ7cLtEs/OCgUz7pruRggZxOM2JnBA8oY+ZBEOLFECXItFNJfnFnOJZiebinWzGej66v
	 QNCSJcHsN8tbZaawfvrRwnh081r5Ddr+BQ5LIIK3KkNOs6i7FifG/vCfsBlp90g4MHZjA
	 zNkPHp3X7P1iudu66P/TX8uTAJGO8JybjW3FF7d3KmJog8tlTILizNVyk3+OKNZuM6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UUC6ciMV;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3907B60A6F6A
	for <linux-staging@lists.linux.dev>; Mon,  9 Nov 2026 17:51:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3907B60A6F6A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UUC6ciMV
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so11956435e9.3
        for <linux-staging@lists.linux.dev>; Mon, 09 Nov 2026 09:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246679; x=1794851479; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aNMBR4KqypyM8nZC0Zd6F06XAJ3Q0+V3qNyKzqi9O44=;
        b=UUC6ciMVk7Hl7CqXrQOqox/XXghALwlSNC7hy+w5SCL+d3qBS0x6H7UyJ4Aas+BqSP
         94o6BO/q4S026KI0BCAoy6awhzjfVyYQXMQ3RsmiKA5gcJKZjk4+URvYSideIDwH+7R0
         zzJo/DI/IRwvtRk9GbL9fa5F3HgTDjH/jNx8IvND60SHc+DSXEF4bk202N7wAQKZfipg
         asNRFi7Z5bchDRCjAwtqhIQ3aTDNAVr4qR/XsKarnrY+j3eG92sKBNbG9rp/vony+3J8
         SSMR6XxQEBIbHwuYuMFOe0/ejNEUMpy7wb7j3y6wsbzFq9S7oCNATiCp/xju+4vAfsNs
         jnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246679; x=1794851479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aNMBR4KqypyM8nZC0Zd6F06XAJ3Q0+V3qNyKzqi9O44=;
        b=gXaVRiBiUSz28Uz9SfMQgWrsBhyc61LTT1dGoBuDjfxUKdXSZ2HmHPlaiDkLS/ddMt
         bpyb+DDz4xT3/cQWyr/Vcss4KP7xk32Zz6xJ+wjXIQhNBnHeRFbjrz56dhuQswQ7EDq/
         7mEHaMkvYSnojPOEwNLqMA7ue5Q2JKSX1ztHxlCnNcVbJyTBOyI5krpb/dgF/AnCPGSf
         aRPyRJP5t6OudMvZZnYYFGGE4HI7NLvr5nvB0SPbRmFeYg6NhmAtfrO2WCj52nrQ/lcC
         8g821nTVJ3IW4e170ZuqVZlAQB61ZrPQ3XmEx1KvgZugsFpfL7q452LM7PuPsF32hrAp
         EG8Q==
X-Forwarded-Encrypted: i=1; AL+hErFsAmaMM3HMrYoAmQJFdnQMIPIC/hl1/vaEp+4aissUqy0TsaZlFJgxzXowjfOJgg87Qy1q92VWiP5d9dv1@lists.linux.dev
X-Gm-Message-State: APuU4Z9J8HbMW7Q/Slqmc4NEGI5IBT/HFYU1OSCMfVniCbfW3khU7x4L
	kG0CV0dJfzagq4URLEi+4srZXkf/22S6jYyd5Y/YCeIoPfjKAlIvLCSr
X-Gm-Gg: AYBFou22NjaBK5qBg5IZlwGUJp8DtFGaNE4FkHeULVkS5Jkv01+JuaxTHJbT2vQKiPT
	CNtm5aq7EO9l5OJ8SS2JT5MuTo23+HVdl5JCZizir3oUL8CDwuZZMISl87CnGUVMiihJfUJRXpy
	caO31c1LEaVEpiFZRJ4mXXbB5v0NAKgFxM+GFGXHLAz9wWD0GsGP3Ixm+4tOBYiMnnysfwcCxmW
	Chrm7G5bhrTpadGaqpQxZwS4WYiL8oZJzuQ5eOPqt3RGhnD5A9MhAY9sJaJSPngf8ETSv8gdkmJ
	/en/iAGmmwTT9D06r7rFWRnjXUdOFKOCtDu4+tc8ahfypm2np/e9xqhX/+Iay4I25Tl2NxBtGYY
	hxJa1/BeqbinjgA5rDERyI5d9y60UgX7iGXF/yYKX1yXrWXUPpFo6jt8+ALm/x+jO0B1T10gY/+
	MpVpTaec6ah7MB7cr1n5/MPsd0BWKLzuJy2L9DjLRa52XPWDdvLSmj3f10QX9fBZBrmK9S6L+zF
	UzLkTjAjCMZ7SRaO28wBnkQNMDujXqCLMTNN9blZyRuQ2WXbYZ44aJFvrKDPiAdhaLIZNyeEPDo
	DxL7xKPLgUeAnLed8qeOji8Vh+P0AqvYl8X6ixRX6l1CulhLHCITr45OnQCTrXQF6X8fkgnB867
	KkKBWLhYRk7HsEZ2bFxW0oCsXw8wQGr2RAJzqI7Yi6UjuDQC8/Tz3TmTDcmmJrrzApDUVJFYyUE
	ILBXBZZhXAiPeE8bWa1g0JEZgmmLRiWiDITB9qtS7uptWDvT+he5lYW5EcCmaLwvDpeBo5gZQXP
	sdyC2DU3cc0ncehsEOKtJ07GyjgUBGMxZn7tzr2Rjpau24RmBiL5Q/B+gNGf/rJlLc+Ywvk
X-Received: by 2002:a05:600c:1c02:b0:4a7:d9b1:b684 with SMTP id 5b1f17b1804b1-4ba0230cc8emr216685e9.2.1794246678645;
        Mon, 09 Nov 2026 09:51:18 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:18 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 10/11] staging: media: cedrus: h264: clear the DRAM buffer sizes on start
Date: Mon,  9 Nov 2026 18:50:15 +0100
Message-ID: <20261109175016.42061-11-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109175016.42061-1-jernej.skrabec@gmail.com>
References: <20261109175016.42061-1-jernej.skrabec@gmail.com>
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

Above 2048 pixels, the H.264 decoder puts its deblocking and intra
prediction buffers into DRAM, and stop() frees them when their sizes
are not zero. start() only sets the sizes for wide pictures and nothing
clears them, so a narrow stream after a wide one on the same file
handle frees the buffers of the wide one again. The codec data is also
shared with the other codecs, whose data can end up in the sizes.

Clear the sizes at the start of start().

Fixes: 03e612e701a6 ("media: cedrus: Fix H264 4k support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index 97958ceee8d1..e7a3bfbc3531 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -573,6 +573,14 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
 	unsigned int pic_info_size;
 	int ret;
 
+	/*
+	 * The sizes tell stop() whether the DRAM buffers below were
+	 * allocated. Clear them, as they are only set for wide pictures and
+	 * the codec data is shared with the other codecs.
+	 */
+	ctx->codec.h264.deblk_buf_size = 0;
+	ctx->codec.h264.intra_pred_buf_size = 0;
+
 	/*
 	 * NOTE: All buffers allocated here are only used by HW, so we
 	 * can add DMA_ATTR_NO_KERNEL_MAPPING flag when allocating them.
-- 
2.43.0

