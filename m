Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3200D17C8
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 10:36:53 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id k22so6314490wrd.2
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 03:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T+H9uo8jaDQ+kAk6GpwLVDlfJtlk/SgUkV35P9NpXgY=;
        b=l9ztUzpU2wRO+hzdBfUprIPjKonUiQxgtSHxGQCjqNQn/2qVyihMV1BTV6Yp1hLgWV
         JKfjhMoWW+g4zIVo9QKAVW+t02X0RwnJ/OzdUEFcQ83XHDBLeWM68ALhAq8McUfQY4Uj
         5Yr+QVJ1HSWKZ3WEF/J7NuRboDG01MN1gnXUmGXrFrPvP3VqfMo4TfcUhxg7+VX7gZBG
         ll/x5T8M6Jk2iTMNqSUOX/0O7/XKREyrDUXOnVtTOhYi0JrvAIV28kOlprJDJgB5p0cu
         V5V7zxxkHSPMixnUGqN+XuTBGlsEl7n5xvDuf162O8b1rfOlUL3knPt0tQEVA/LTMxlw
         Qo2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T+H9uo8jaDQ+kAk6GpwLVDlfJtlk/SgUkV35P9NpXgY=;
        b=EXPl8uMu7jb8v47aP/Nfpeq0ZWM/oYAodrYR3EcMz2CBBnWGAnzBNzoAIWZS3u4GoM
         5/U4o+CD6g+eLUPdvFv6Jld1dcxrzVhMEwYjiFdpa1+3MDP7Z1U+JD2YY1Z24PG3s07M
         tyW5rhWwHKU2i/uNkSIVOjbIUTWng+ns1rT1zgP68Z6PgTtOwDiFrEwSnPBIeXCNCkiX
         7ibugTumOkuZ3PevAS81f4A0+3dGNrjZLnQg5xWA1Z3DXmBWNobfkJNOl/DMADZSV1dz
         T/c/09j0Ld3VoaRSS9x3vAoRvANMAvFrt5eIXSVihhNqmzdnvx761y6X0GUSBR0GdxcT
         ATKg==
X-Gm-Message-State: AOAM531xg+wjWghhNQgi2hzMxvTEZA1FXFNwRwtV5k5e5skKbSN4MMHZ
	v4QFbKGz55/lCCDTdzFdb9M=
X-Google-Smtp-Source: ABdhPJwXV3YcP+8w+S0kD0SJTZ0cELq2D30GQr5G2hcFvNyGEpDonekUEQKh7+KK4uvvTBtW/681Vw==
X-Received: by 2002:adf:f348:0:b0:207:a696:db82 with SMTP id e8-20020adff348000000b00207a696db82mr1641280wrp.292.1649932611540;
        Thu, 14 Apr 2022 03:36:51 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id p15-20020a5d59af000000b0020858885fd7sm1830260wrr.9.2022.04.14.03.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 03:36:51 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][V2] staging: rtl8192u: make read-only array EWC11NHTCap static const
Date: Thu, 14 Apr 2022 11:36:50 +0100
Message-Id: <20220414103650.297396-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the read-only array EWC11NHTCap on the stack but instead
make it static const. Also makes the object code a little smaller.
Remove comment.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---

V2: remove unnecessary comment as per Greg's request

---
 drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c b/drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c
index 358c35d9589c..a93f09033d9d 100644
--- a/drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c
@@ -480,7 +480,7 @@ void HTConstructCapabilityElement(struct ieee80211_device *ieee, u8 *posHTCap, u
 	}
 	memset(posHTCap, 0, *len);
 	if (pHT->ePeerHTSpecVer == HT_SPEC_VER_EWC) {
-		u8	EWC11NHTCap[] = {0x00, 0x90, 0x4c, 0x33};	// For 11n EWC definition, 2007.07.17, by Emily
+		static const u8	EWC11NHTCap[] = {0x00, 0x90, 0x4c, 0x33};
 
 		memcpy(posHTCap, EWC11NHTCap, sizeof(EWC11NHTCap));
 		pCapELE = (struct ht_capability_ele *)&posHTCap[4];
-- 
2.35.1

