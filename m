Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0710125F780;
	Wed, 21 May 2025 13:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747833919; cv=none; b=OgSZxD3MiPHn7zF5Je9wtTj/RZOmi4dVWZwnqNwJapLiaPezl95eLXUoGNF2D4m+PJOJij3Eb9omcRPCG+2/M2qJw9VBfY8Hn/+NU6pAvfO7pNe74D88dZ/YsvVYcuP6vtOHf81v/ukJWVLpGOWwOoTm0KEBfVtZ4/pfTzNAytk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747833919; c=relaxed/simple;
	bh=KaE6+o2aGnDCIXUMVFpEenjktipp41SjDhYjR6qnzu4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L8CIAUXsj18qFeybYtB5isub6xvkwylMBM0RLQ5jpsPtB2LWnPGH/jP574AFaYsgnqMFdy3qiYC2PAnY4JMwdKgRCwaeGlpVGcJ02nBS5hAUfLGhSIXzjZz15V0XTjId8LIBBgn+s+0GVo/bPhYT6IV6vYeHV1Ew4bUKgr2JgFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O6RoG0lq; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O6RoG0lq"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-440668acbf3so3497835e9.0;
        Wed, 21 May 2025 06:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747833914; x=1748438714; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aD94Cyds9PidEz6jUW1CAFksapgbj4DqOx2OqS8w/gA=;
        b=O6RoG0lqkx8rhzLR44NbKC83Gu56W+Wo0DDStzP7CyFL6EuR365epjOVkalhVs8AxV
         JQCf5EO54zM/6GKSJA39GAJKb8uFKfkgq72mTK/iRUCBDWwcX882fFcoawSJz+Pth79x
         zdTqwR//mQhNf4PvjtadQSnmkEx/CHg7KnJGmdQe8fKGyc4bokzSWQWA5aITETh6VIQZ
         MLWjT143uaPxA/vacgn76dYe6suuw3p9UWpb1y/ehGWteD2FxN+MDy/OWwx/kLs+5Urx
         hcLYPMi4kRCuDqBy8dcC0ikF1DoBQgoLFtOhlkEBUNIgqkg3ajktAvznH0ZD9ljZD7uz
         0pUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747833914; x=1748438714;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aD94Cyds9PidEz6jUW1CAFksapgbj4DqOx2OqS8w/gA=;
        b=H2qYKVh0oxvJTWUSvN2+NZZUAtYmbpUBJGncgPou0vdSCbOvBLs8nial0pDFgH/Naj
         oxk3Lrq0/AXR0C+YkrZ32P3xl6Uuksdpv4O2ZDLnSrovcPszukhjCbILKwhp+tvYEoeO
         UppiNHmf+CA26vCU88J+xZknJmWZoKsJ1VzY4u7s5xaieGjZ26hhHn8xAYT1SfPUbtCf
         U4lM3OkmNItkhHUi8Q2dIwQLnlTS2m7Q7WFqAfE5Di8De1bbL4Q6/FWQGyvcHfk5uni+
         dc9zPFjha4Bb49r+DhKyqgTRjxZo5f54kW90WwFt/UvSLl4tsRMC7kbFYCqiWFLqotnA
         lx3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXHCN90wsm50g01W92f5zXLcUlNpmOoN3IUI219LTJ/PDE2m6jQY8zTP1Cg3xpBYaXmLJn+bvrhgbNU@lists.linux.dev, AJvYcCXZqyg4yP32aWBgi3H2oxxfhX+dUWNy2XnJBEsB6OleqW+GloXJ/zdJ33qLPfUpyGNZTe6uGW6W/8pDpMyX@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/01lBflvJdGMWeFxjLR3qVAHUchZsRKrg2oIMFWJ6hxVhlbff
	9vqx65yP3tLkTFzeZ+htY7sD2dip2fl4rS89732KIVZj5Dk/oKkTu8zLO7GWdVLveQJoyQ==
X-Gm-Gg: ASbGncsR2RUtTi7P+O1V1B5uP7Bq2kiBGL/t2+Sp8jMn7mhoUeNsdYwiw1VSTGg9zfv
	RcXkGqbkssXI5brQbJdU+VGMj7v3a0+cw3/jaUNshS8rou3IwAICXjEixxTMddoCm7ZOnLkwieo
	7iTzpHD/8oEqGFN3j1xd/2Tcl54/RpzCCgvYZwF2/ocYk4MiaP5zm0DViohFIFuO7+lTEL8TWz4
	D1ptBIsy2Ul5gwmqGfisQ5CZLG7pG8T9XMUFnHk0vPUEaxOxjoaTzxD92gGr6ir7n/ZBbSs9XHn
	O/cpxkf7R3Nz7Gs/Cc6kjcgVUrgnsEEgf+5CXitWD+3oX5I0qitH9uj7YFPSSacrokDYuRC2fTl
	Ieq9kFBtk8jQYXgdAa2fajy/rVqEturc=
X-Google-Smtp-Source: AGHT+IHCJ5eTLFeP2ll8ttDks7kJdJ4nSpWPbjGCtqHqI22EbSubTX0w0gXypEMPHz50PPHd2O6DjQ==
X-Received: by 2002:a05:600c:a07:b0:442:f97a:fee7 with SMTP id 5b1f17b1804b1-442fd6770e0mr73698685e9.6.1747833913804;
        Wed, 21 May 2025 06:25:13 -0700 (PDT)
Received: from milos-ThinkPad-T14-Gen-3 (global-184-11.n-1.net.cam.ac.uk. [131.111.184.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6b29548sm74461595e9.4.2025.05.21.06.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 06:25:13 -0700 (PDT)
Date: Wed, 21 May 2025 14:25:12 +0100
From: Milos Puric <milospuric856@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: [PATCH v2] staging: rtl8723bs: Align next line to open parentheses
 in core/rtw_xmit.c
Message-ID: <aC3UOPYv8HmzRvij@milos-ThinkPad-T14-Gen-3>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Adhere to Linux kernel coding style.

Reported by checkpatch:

CHECK: Alignment should match open parentheses

Signed-off-by: Milos Puric <milospuric856@gmail.com>
---
Changes in v2:
  - Include author full name.

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 026d58b4bd7f..8c6841f078b4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -381,7 +381,7 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 		while (true) {
 			/* IOT action */
 			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS) && (pattrib->ampdu_en == true) &&
-				(padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)) {
+			    (padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)) {
 				pattrib->vcs_mode = CTS_TO_SELF;
 				break;
 			}
-- 
2.43.0

