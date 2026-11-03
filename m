Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793739275;
	b=SM/QxZxtwdcGlfI6SoZV3YMRpEe/J9haLTnspTkiDR8Y7AAVXMMyCBA0Q/J3/hSgnKVe
	 z6AXa3w2xdCLjq7dDDv4mB5PJqLrYorS1q6vo1xPa6fL8O7XxEipuuyPcitj1wBzAanfm
	 +p6ocyoy6tXlmik/gFFpVyBXNx8wTLiovH78ftKtnBz90AHpM7ger7n1zWnVi5ynTwe7u
	 Y3yRmT63QPWHVTg5ZK57kYCqjEMp/MLjWsou4ooitUO8VJ95gi8HFQeO4a0RS1rvrYqaM
	 E+LXDLyMQ9K8UINBg1qFbylO2pGn01C9t870JGQYAmA/DfTZJUHLmMJM7tf2O+IC4JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793739275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=/A80EODLCyXaaGfYKqpHl1AEtmb4ixEKWz6DBGz/WQs=;
	b=CYCebj5PJoj5ma9dGtN0dU1en/ihfxaYBN7aT7s8rXEPxjQe1XQsY5N0qoTiV1TzcoFJ
	 aom40KKS0cM3V+n2nMqJSu14YKpQOCTB1bNg/5/JoEArc/Jsx6oon/z5Mz/fgd1n+5T0l
	 Sic18O/mn6gPvH752e2raaaaNwYuNp7azrX2e/ctD2ZTs8dVLZ84IoCRZrYokBNCU+pbU
	 6755z8bjG0By7D0AWtuOV+2nnzsLTU8TvwEiPc94Or4oX7OYPfv6g5bzt8BoC8hBjEQvm
	 yqoDgJ9+ccmmdcmQZ1iAO1ooc4FIx92QG1wvtY1hJ84R5/SH6vLiDWo/GC/5gXoWifQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q6V6bAcp;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515AF606A32E
	for <linux-staging@lists.linux.dev>; Tue,  3 Nov 2026 20:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 515AF606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q6V6bAcp
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8ac525c1f05so290497b3.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Nov 2026 12:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793739274; x=1794344074; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/A80EODLCyXaaGfYKqpHl1AEtmb4ixEKWz6DBGz/WQs=;
        b=q6V6bAcpMImDob77dM/3iuZ1bH8cYL6Wxab5ifAiuHfPmQyzLE3wlj5cKZqtCXUi3G
         kTMV4Ew346fCDJPTFwM3EzyIx/cxxWSOm3CKkX0szLfayGoWySDlN4HpAqPP5DNTWrNA
         KP8MnPDmpHEOWL4ayxO9SCc6tdQFgy42cv7n23Wqx0ps/dXYL8vJQfVfuMUJw14Y+OMN
         X+lreF0OStZvPOSu8D9SCedc+08GyIwsE74AkJ7zpO0kTi0/UJCDxVPBS7Q/Q/M0fc6L
         4x/3vbxmVeFKrNKmD8kCsoNo73pGVxOZnYKheuTJfAXPTPWYTRnKBUsYy8RM9MPpLqjj
         HKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793739274; x=1794344074;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/A80EODLCyXaaGfYKqpHl1AEtmb4ixEKWz6DBGz/WQs=;
        b=RRe4ROBroO+ufIVU+HlmO6XisLCT74d96bCfkRNxKooHOtPGcPBmh1HXObyoBDoXBD
         54UhMNDSN/fwkwwOLk8LidFtlbODOMHpz22iUImWvb3uTQhjxrLClrL4ML9BAR2wOhEp
         xfgL/9aTfF6S/G78naCNK34krPg4PqiBZ5hv5V94dy4Jiy8wf+H4g4KYP2K/lTshJNIa
         eyFy+XiLoLvq7UMHL7L04XoBKvORilG7s0PCK7tCO5DHHzkFEJp1EMp5iMYRWdzmHMv0
         30ZEYwDJsMZiz3pRI3MOAm6zI/xfn9b9AuC3ZCKTpGIAUEYGe5jsYpVZIlAlIwgfXDaw
         Iukg==
X-Forwarded-Encrypted: i=1; AKwUvByMOlt5m0DsN7O95Tk51raEURaIylqjJrV2iVdRH2j6ht7EOktU3vJWOuJCvd+iReLwMERQQQNzjdL3T+5v@lists.linux.dev
X-Gm-Message-State: APuU4Z/PtZS83WRUHQa4DEr5DWeNJwX3PoEyaiCm5z45VRE49s67TUry
	0KRD54crCR+3tziOI1zq/e8R7maDOF3X+nHDLvGJw4Ch30mlERNVGXW/
X-Gm-Gg: AYBFou33FD10VFjhB4M/uoXkjCVs/HJy+UNC8fsej32aOERe3vQqNFeQNTg8AM8mBmU
	wAl4sMs+e3iTmW8X40AHicKBcVBzKW2FZWzuCKpOdubeC+Kz4olPljFbgNx6vF/8Qm6iUAH/r0Y
	FecA/DeXyBaaRyrTBGt6hH0uXAlwO+2cuBFID0XfMTC4DUl1PZKmy1b7jzv8stL66p4Tkj/jaCw
	2fYhjHgVsr9rIT3M9LiRS8VorS1SePMnBdZHBQ2shb0phJ2sCf2ZtHBG2a2eREKSBzoucHuQzsW
	s1Xu00YE5qEqd0U/sOCuP2G09OW0Yqr04/L82eGu2yK3dn1eO6z2lwfdqIfv/Kw8epLNfrI1OdX
	PNX9BQ+LpLQRLhlvk8Ld50bnaoSaeuJNKdn/VDO5H0iI40wC3KUIfzn/Rm1Ms//bv2sZsCf2+r9
	LZYOggxrkV/O0UnR8eDfwNeWFBYfkJS61wHm1dcjk5SiVmb2ZgaPzzWRTDJ1QKb107qee5Ywd2s
	66IbRWGGiasxCrbcVcVevb6UwaDye9MKmvbTwvSgryjzVTsexECi+oRZC3IIfwjOLOGa+iWd/AR
	i/On2R/D2MCs47LsL04meu15pS3kbyhNsoy46QcNkaVsacRVzyiar9fGhA==
X-Received: by 2002:a05:690c:4992:b0:8b0:e680:616a with SMTP id 00721157ae682-8b2b66f45dcmr112559257b3.24.1793739274317;
        Tue, 03 Nov 2026 12:54:34 -0800 (PST)
Received: from daniel-HP-Stream-Laptop-14 ([172.56.75.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309bb4406sm4805187b3.40.2026.11.03.12.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:54:33 -0800 (PST)
Date: Tue, 3 Nov 2026 15:54:29 -0500
From: Daniel West <daniel.west.dev@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: staging: media: sunxi: cedrus: spelling correction
Message-ID: <aupKBdon3N4Kpnkt@daniel-HP-Stream-Laptop-14>
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

Correct spelling in comment.

Signed-off-by: Daniel West <daniel.west.dev@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index 780da4a8b5af..f57642c0d8fa 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -755,7 +755,7 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	}
 	cedrus_write(dev, VE_DEC_H265_SCALING_LIST_CTRL0, reg);
 
-	/* Neightbor information address. */
+	/* Neighbor information address. */
 	reg = VE_DEC_H265_NEIGHBOR_INFO_ADDR_BASE(ctx->codec.h265.neighbor_info_buf_addr);
 	cedrus_write(dev, VE_DEC_H265_NEIGHBOR_INFO_ADDR, reg);
 
-- 
2.51.0

