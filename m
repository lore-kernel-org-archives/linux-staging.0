Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD097B;
	Sat, 16 Apr 2022 10:25:09 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id l9-20020a056830268900b006054381dd35so561311otu.4;
        Sat, 16 Apr 2022 03:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iAwdY3/hpZa+mDgOL5jFRGta3ky0j/Xe63lExx20fBM=;
        b=HVr29EqsqK3Zl2aR8tUdn+y3xstnHREd7s8CtWCSqIvUVgS0oLKIa3ibRiuEJFsY1u
         /UCCFzQ3T88Q5CArGa9lSjdPbSbjA/C1R7atgIPAOGnSrsdqXyWqtswmzCHOf1JVnMct
         Cl2RnzDt//+tu1fBM+AMLrkAGvpE/HBPE0LjyWJga8KaNqx1FRcFHBLPdyTwlWzjoEQD
         iyfvsLyVqBPpcyEXJZmB0MBg7v/YiArtZh/w449/Z+MqeryRkgoCl+ExvyNdHYCxswwE
         XedvTbaO0rgtbfBvMUH1l/JhdT4uuf/X+s/YxUTmcL/U8QF62vkY52p7DiLF2WK1t1yB
         rDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iAwdY3/hpZa+mDgOL5jFRGta3ky0j/Xe63lExx20fBM=;
        b=7B4g/VdCl5t/85u1M04hlvDG+eHs1IRaqJMoFfoZSBPcYU5EM9rVoNc3dYLCbqR7zf
         rNjrP3C+gHnrql9XEVc2+srkBYXuFIzhJ7gv++paLbXYaslsveo7YO7WPWmg2L6mvkit
         K+c+Pk6VsaVrvYpfNacHvCvPeKFpqZAmXxm4c3vD2jUAKZvX7hxGPZmv5x6EmVeCQmJ4
         Z3soGg9caT6BqGdaK610JPhbNOKA3rU6x+M08e6Eq82yppoFUSH9NXvCjfbf1G0S4YhG
         ZOS+xj6og161MYhCGYIcuCJ9oQRL+GaPKMDK5WUQnuV0KGxhm0r5QW8h+2jXRkLuWA2q
         cQcA==
X-Gm-Message-State: AOAM530U4jwRIrwgKDrha522KHWeduh25FchUZeihpuM6+fhAH4aeoYN
	uI0eQ9t9bwNiTlUxZ5KZwcY=
X-Google-Smtp-Source: ABdhPJyLKZhUaF8GS1HD5pzG3omywEfOv5Ge4CVMmZ4eh2pLDTxKQnOI/7pgVbCkE9sNl8AOamyhzw==
X-Received: by 2002:a9d:65c1:0:b0:5b2:3556:a612 with SMTP id z1-20020a9d65c1000000b005b23556a612mr961395oth.132.1650104708229;
        Sat, 16 Apr 2022 03:25:08 -0700 (PDT)
Received: from bertie (072-190-140-117.res.spectrum.com. [72.190.140.117])
        by smtp.gmail.com with ESMTPSA id r3-20020aca4403000000b002ecf4d70c83sm1910132oia.27.2022.04.16.03.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 03:25:07 -0700 (PDT)
From: Rebecca Mckeever <remckee0@gmail.com>
To: outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rebecca Mckeever <remckee0@gmail.com>
Subject: [PATCH] staging: rtl8192u: compare strcmp result to zero
Date: Sat, 16 Apr 2022 05:24:34 -0500
Message-Id: <20220416102434.97567-1-remckee0@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add " == 0" to the condition in both else if branches to address a
possible bug. strcmp returns 0 when its arguments are equal, which
evaluates to false, often leading to errors when used in if statements.

Currently, the statement in the first else if branch does not execute
when its arguments are equal, but it does execute when crypt->ops->name
equals any string other than "WEP" or "TKIP".

Similarly, the second else if branch does not execute when its arguments
are equal, and it only executes when crypt->ops->name equals "TKIP".
The else branch never executes.

It is unlikely that this is working as intended.

Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>
---
There is a similiar issue in
drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
but I'm not sure if it's incorrect. The strcmp on line 2847 isn't
negated, but the ones on lines 2851, 2853, and 2855 are.

2845         /* IPW HW cannot build TKIP MIC, host decryption still needed. */
2846         if (!(ieee->host_encrypt || ieee->host_decrypt) &&
2847             strcmp(param->u.crypt.alg, "TKIP"))
2848                 goto skip_host_crypt;
2849 
2850         //set WEP40 first, it will be modified according to WEP104 or WEP40 at other place
2851         if (!strcmp(param->u.crypt.alg, "WEP"))
2852                 module = "ieee80211_crypt_wep";
2853         else if (!strcmp(param->u.crypt.alg, "TKIP"))
2854                 module = "ieee80211_crypt_tkip";
2855         else if (!strcmp(param->u.crypt.alg, "CCMP"))
2856                 module = "ieee80211_crypt_ccmp"; 

drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c
index 9885917b9199..d6829cf6f7e3 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c
@@ -688,9 +688,9 @@ int ieee80211_wx_get_encode_ext(struct ieee80211_device *ieee,
 	} else {
 		if (strcmp(crypt->ops->name, "WEP") == 0)
 			ext->alg = IW_ENCODE_ALG_WEP;
-		else if (strcmp(crypt->ops->name, "TKIP"))
+		else if (strcmp(crypt->ops->name, "TKIP") == 0)
 			ext->alg = IW_ENCODE_ALG_TKIP;
-		else if (strcmp(crypt->ops->name, "CCMP"))
+		else if (strcmp(crypt->ops->name, "CCMP") == 0)
 			ext->alg = IW_ENCODE_ALG_CCMP;
 		else
 			return -EINVAL;
-- 
2.32.0

