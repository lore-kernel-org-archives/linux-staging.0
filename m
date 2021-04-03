Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04266D09
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 09:14:48 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id b2-20020a7bc2420000b029010be1081172so3324901wmj.1
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 02:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wv9UQx8pFx9EKn1LAk5Wrb1T9ZM1NP2AqUIoiI8Ejp0=;
        b=GgcxVrIqbzzGZUKn9kCk2bTk6pfsX1KZlAOJoztPZ0twS4YJ7DdP07HqspINt1YVbS
         DMYtFbgNwJfUwsr13wEROlA4mHe6UwHa3vYM/JkVP5xOXkOD+B/9QRXhFenTbshLd+yE
         Ly7s9mSur4JIIYmbwq4WlEFaZrJMAO41pbYi3ROAOB9GWe7gm/evTycuy4tNAHyfqFEH
         t8LT75OxQUpCeBLXS6NWCxFoeQgdajumX1Kwp2ICt6T+SRj4+O0rez1j4yKHDpmoA38h
         l922dg7ZKcv77qdeFnlgvvhziCBpqzJdYF1gu7BV2uFVkZAFsr1ju5fQ6YfTbWI3/6uT
         8pVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wv9UQx8pFx9EKn1LAk5Wrb1T9ZM1NP2AqUIoiI8Ejp0=;
        b=TnjhmICX137w0mQNTvk1ooOmWIkRa8mycTCCL1fbyffjLrwKX3h+A+dv2tc/7x8zgU
         RLQKSi5/pcA0lUsmbuSg6gevGiUOcroKwpFsqu5tJ2kzJ8KtOpHsYbT5wAHmFY1+NYe3
         +x88/llPAwFVihvuYH+PWkakthx/W4mxxX5uBB/W+YjH2E/b/pfeuwEoSmX6jvb2URew
         5aq470NDatJrSSJCAX1PGxVn5inL1gJ1domJa76hH1selMa5VzFbqTP3DamE2/HHVBS6
         GTsJ/PGZB2jAFAXqSDKsZ6kz+n6Npa4Z1fR85z8XH9iVdm+02lAaaaFGkkz7M6VdbtKb
         tu6g==
X-Gm-Message-State: AOAM533ILc75wOS7x5KnGokLMwLXxWmgWlpP4Bz35kDhPUl60p23vjaw
	DPgtQlbZSBThZT671OKyDqrfj+JiOfM=
X-Google-Smtp-Source: ABdhPJyMYoHNiowzK3hCN2vAsR/aRTO/ohL/UTZiBtgTBZHRJnTvzcSle8HARxu3XIusqPED/M3ESQ==
X-Received: by 2002:a1c:ed0d:: with SMTP id l13mr6857363wmh.78.1617441287466;
        Sat, 03 Apr 2021 02:14:47 -0700 (PDT)
Received: from agape ([5.171.72.64])
        by smtp.gmail.com with ESMTPSA id o2sm14843788wmc.23.2021.04.03.02.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 02:14:47 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v3 21/30] staging: rtl8723bs: split long line in core/rtw_recv.c
Date: Sat,  3 Apr 2021 11:13:43 +0200
Message-Id: <915095ed64d5322b51fec8f9c2146acbfa6944b7.1617440834.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617440833.git.fabioaiuto83@gmail.com>
References: <cover.1617440833.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix post-commit hook checkpatch issue:

WARNING: line length of 113 exceeds 100 columns
110: FILE: drivers/staging/rtl8723bs/core/rtw_recv.c:381:
+				if ((psecuritypriv->bcheck_grpkey
	 == false) && (IS_MCAST(prxattrib->ra) == true))

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 953351f896c3..c8a13d733c98 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -378,7 +378,8 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 
 			} else {
 				/* mic checked ok */
-				if ((psecuritypriv->bcheck_grpkey == false) && (IS_MCAST(prxattrib->ra) == true))
+				if ((psecuritypriv->bcheck_grpkey == false) &&
+				    (IS_MCAST(prxattrib->ra) == true))
 					psecuritypriv->bcheck_grpkey = true;
 			}
 		}
-- 
2.20.1

