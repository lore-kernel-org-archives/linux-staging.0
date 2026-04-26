Received: from mail-oa1-f65.google.com (mail-oa1-f65.google.com [209.85.160.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC482556E
	for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 06:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777185711; cv=pass; b=TEdd3io8a9qRfHeLd2L4cBkHjKtSzjvwIbjKX8SpsMba5DIRj85SykWZns/IQ0S6eGSMDbNAUXUEaU1V3zDgPJbfUIHgMfVB9ietM3aEAgnQ0l47hTmLrOQisv64jHTL9e9Wobt4N8vCsJ8LQP2EKHcijHdqs14MYx3XSBvzzsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777185711; c=relaxed/simple;
	bh=Y+yNl0+gCAiyLMLmX/fECo6XnAaBobWkHhf0rlKOzrg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=NIuLeSFljfVKuXnsdZuBk0Xbhe0eQKQDRGdoDxuLBjuffVXuPD635FBIlcgvTOZ0yCJRZXb3gCJ1Ybe2npwH9Ccs24U+AZGM8c581Z3icS3/rj9Kq7Ii4JhwLsD2VV5sEme6IwuK4F824VR3kP1wKZPeiwPx1cfmKmNV3HwzgdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h0UD9FT+; arc=pass smtp.client-ip=209.85.160.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h0UD9FT+"
Received: by mail-oa1-f65.google.com with SMTP id 586e51a60fabf-4043b27ddeaso4983448fac.1
        for <linux-staging@lists.linux.dev>; Sat, 25 Apr 2026 23:41:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777185709; cv=none;
        d=google.com; s=arc-20240605;
        b=c8oNyFfvGpfOsPMCPs7TFb2M+cAcQ4kK36fcp3cZvMNnnPVamhJjzoFpPsvAybjjqd
         jYry54nrTwnnTWKPFRdxsFrwSx54o/fUcuMCdfUx2fML7gax1ETaKknGApZMIkulH3gl
         sl92+Yi+yFi2C1BkG8ZsbJjmbTDron1DCRxrfGvL9xKMj2YcrLL7S1K8ZDIQi/RgiZOV
         IVCCQNFIRh3oZ1sy8S/ynDy+2Qis/nRg8x1/ayW75+VzJbaC4nOvnPuwbkjsc3KFfpoT
         s90w4pfVEQFWFZmgGtgEWI4lpQsymzR0DtgdRqiuTGtS3qG4cy+J8oW/3yUe2d6WatgL
         Sdtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=CLI5qtMUCESAlI5IMnQeExHA9c4hD5jRGYSz0+vjgYI=;
        fh=OGuGyImkAcJwt+sRhpXRgKfXKBxNQnSga2zoz3XK8eQ=;
        b=KGB5yVH/Q1EyGDnSy3MxbrR4tWr7gdLdrSoSCfS0flaqMNFR3WXhFP/vX6JSRDVRzz
         a2PdC9mdO6j4f0uwXFKn8F4xxpxWcbQg73HPJqNR9WcFzpUzLWbCwAyTm2u3LAt9UxlZ
         uZR/PSmJl6eQUUFBC1TtLxhqOzINUNjcWba7sE8LwteKK9nE1qHe5S7hpoWW55NcZ+7t
         a3wr+WkkR4mDsfosmsl/cYLwyzZv0+/YtAp5H/bHXfDH0yb9gDLxwkRSFxOe3z9tYJZG
         7c3qfxbRh8eLNFMRFuz0mecOiKVuhL4ElZW71R6sIbh1S0eeRFrPdudRiielCYzOYx7D
         DWpA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777185709; x=1777790509; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CLI5qtMUCESAlI5IMnQeExHA9c4hD5jRGYSz0+vjgYI=;
        b=h0UD9FT+TCX4vsaqT179VitkHds/mFNkxbOkIZBWQNSHkCJEeetM0Yjjp3Z2TwPxOg
         +PJaS0slY4Fvz9y8IprawzuBUpSktDSBWtlf0vwIw1j6HF0bhtElnFd87lj4zcLNHskZ
         MDA5tMKkoe/TvaP9uKvcm5uw1ixTfe1TSd7ZXzmfk/CqP80zODijI9kOr5yLr8CwYsK1
         P7nHAPKZBnFrcW76YUU7qVCv73NyOWm/ZLaLIGcTux//sZEvOsdLpLZltXx4JnKESUDZ
         r5vvIrdavM3Fb0KPRq3o/HBEyc70NguaAQmb1TOtLzbOClTX8GVWRiiDZYjlL2pY4j2w
         SxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777185709; x=1777790509;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CLI5qtMUCESAlI5IMnQeExHA9c4hD5jRGYSz0+vjgYI=;
        b=kvUku/yGOKTsJSwGhozOUmBz3IZHjbLRphlGptwJ9tuJ9pWqJY8WdZXHFEvNiXmTt2
         T+I2sUT2L3cAXPitS9FJnHBfoTguMH4wjZWDTGFLXSQx9YXSes0eHObz8yOBUVx5baDC
         bu1myK06tXO5yPjn6+nSVeaXQyT6g5qouubz4YSikkCtdZIGL13FFt4pKHrmcx9YAO+4
         qUVrsujVOiklQMfj6wdoxyytQZmnJjUZAHs1apRXiLbuzlDPTKYDmAHyP5TY9khH2Ty/
         UW3UeyLyhqKJXzME+0FEON+H5+jgYU+ZvFqzwPLvHdy8VG9RFIWufK78DkeEx2qUWOWc
         8L5g==
X-Gm-Message-State: AOJu0Yzi/w27/yPu9FAawzyAmrWIDilnHqcjqXoLCvOc4FGzw48mcLWm
	HBI3V+yjpFLhzuWthwJ4jMxmzWl/w8cEdm5JVu1CRerW/deqUZ719CLPku3L7EBUuqaHnbvrlhf
	r6YN0XcZ1Sy+KtgNDu1BBTQL8JELg+ZeQk3hg1yqMSw==
X-Gm-Gg: AeBDieuwDUplz6ZAnbJyBUVFeMq1NRrSovHLcm2IPsLSXBXPlgjH55FtVq0id9Fi9+9
	wdCU1wwQeQ4VzSMiPV7iNzzTITNiM2xqmEevEtQwjJFXnrHLzebUvXiLU41VXJTROAu7mEdGtK4
	xe89g2oAf6efzLCT/YyothZIiA/5D+UJk6rusJRJKZq7jVCW9KYghzTIqLrb/POGrtoIMzHnSps
	F7eJkfapdSrcYmHPjwkHbcqAodokg412bAu8eb8W3ePaiu++8hG4zC2yf+E7pbN3lGhPuiw1n2O
	JmPVGmYPzTVKl/yD
X-Received: by 2002:a05:6870:9a8c:b0:42c:36c:8bce with SMTP id
 586e51a60fabf-42c036c98b4mr21502085fac.12.1777185709561; Sat, 25 Apr 2026
 23:41:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Lettice up <minecraftwemmne@gmail.com>
Date: Sun, 26 Apr 2026 14:41:38 +0800
X-Gm-Features: AVHnY4KQLFRJev-3EGvgoWftTwEEFDMOHrGJ_fkQ5NyJZQYTa3l4hStlaskFVKY
Message-ID: <CAJYuYVmJ93xKgV2cT8=C5ah2e8Cg47tHEEBr4ka59K9Bogq96Q@mail.gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix line length in rtw_cmd.c
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Lettice <minecraftwemmne@gmail.com>

Date: Sun, 26 Apr 2026 00:49:40 -0400

Subject: [PATCH] staging: rtl8723bs: fix line length in rtw_cmd.c


Fix a checkpatch.pl warning where a line exceeds 100 columns

by breaking the long memcpy() call into two lines.


Signed-off-by: Lettice <minecraftwemmne@gmail.com>

---

 drivers/staging/rtl8723bs/core/rtw_cmd.c | 3 ++-

 1 file changed, 2 insertions(+), 1 deletion(-)


diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c
b/drivers/staging/rtl8723bs/core/rtw_cmd.c

index c1185c25ed36..50662d44a4b6 100644

--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c

+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c

@@ -557,7 +557,8 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter,
struct ndis_802_11_ssid *ssid,



                for (i = 0; i < ssid_num && i < RTW_SSID_SCAN_AMOUNT; i++) {

                        if (ssid[i].ssid_length) {

-                               memcpy(&psurveyPara->ssid[i],
&ssid[i], sizeof(struct ndis_802_11_ssid));

+                               memcpy(&psurveyPara->ssid[i], &ssid[i],

+                                      sizeof(struct ndis_802_11_ssid));

                                psurveyPara->ssid_num++;

                        }

                }

--

2.53.0
