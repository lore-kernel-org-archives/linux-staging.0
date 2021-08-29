Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2C53FC2
	for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 07:34:28 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id fs6so7405381pjb.4
        for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 00:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=rNBZsqRJ7sa4jw3snokI5dgLfCm8tugTaRJ5CIejBq0=;
        b=Dm2H49KMf8j0JXlHRKQ9ytI3sqTvTgYyeX6jrra2h7aR4/RNNLu2h1yRD7Yosp5bJV
         upqmr11UgxRQpD8xUbltTH4YojLPRbkh7RPUN/DZwNy7w/sqnA9prPHhtdBvHyN0BN8T
         lQZT+Qe1z4gMIydI1HLUf/EPDiwVtfQlgQ1C7+jNGnzaWngYXTTBFnJB2B3hcCUUNBBe
         eIBdYhnfoG/dNfBLKTq6aWPoHFNywFX4FaE8eFPWRs+9ZOuLMaE2mF/XpgkwfG3lUWcY
         ZHRLgrgH6DqLXD1OlM3hP3uYbTY40syiQMhW0AllGMswzl/toDZXkwb3wp2brJzNgcQS
         KKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=rNBZsqRJ7sa4jw3snokI5dgLfCm8tugTaRJ5CIejBq0=;
        b=PWCs2nwm/9bgtmTWto1ltGLtpCUzDlr5b7gLUn8gFgvWWSPt2d9TgVbNMvV04PxBRf
         QmokWwoT2iMV7w46TkLPnZYkCbtnLIoN1p2pLrlnAxABVANGzpjbuLVf/FlBMtfXIqIQ
         bGqa6gA6gqYsfDJQ2D7x+copYGb1D30ZqBxrdf8OLUApC1HLJECyt+Ko0xeN1wfizLBr
         WYQe2i9+loY7uzGGRD+YPdaBfqyWI6sK3Sqf3Q6lmJ//V1nNZtkhJkwVmjdk5v8jSjx7
         ZApG4/Bj7Ltm8ec0E9bqox5aqqqm3DclaS+SMU6IVty0Pt/X2crxZr1uYuT6b+dGOeSd
         INsQ==
X-Gm-Message-State: AOAM531PVFkyCrreoqyNhySr8iAuGo+QyEKltYfz6dQT/vfcVKqgguGl
	e8jaI5jT4s8Bf8xpkJPwEfY=
X-Google-Smtp-Source: ABdhPJwSk5MbWVucehftZPaXxbAzo+mGxol6dbNojKUdm7c2HxjSsHv9txv2vn1URtiAyN7RcstLNg==
X-Received: by 2002:a17:90a:2e88:: with SMTP id r8mr32311223pjd.169.1630222468075;
        Sun, 29 Aug 2021 00:34:28 -0700 (PDT)
Received: from user ([117.98.200.228])
        by smtp.gmail.com with ESMTPSA id a23sm6262239pfo.120.2021.08.29.00.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 00:34:27 -0700 (PDT)
Date: Sun, 29 Aug 2021 13:04:22 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, straube.linux@gmail.com,
	ross.schm.dev@gmail.com, saurav.girepunje@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH v3] staging: r8188eu: core: remove null check before vfree
Message-ID: <YSs4fvzUw1PK4C9+@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove NULL check. NULL check before freeing function is not needed.
Correct the indentation.

ChangeLog V3:
-Added change log.

ChangeLog V2:
-Correct the indentation.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_sta_mgt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_sta_mgt.c b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
index f6dffed53a60..c3600cb1790a 100644
--- a/drivers/staging/r8188eu/core/rtw_sta_mgt.c
+++ b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
@@ -155,9 +155,8 @@ u32	_rtw_free_sta_priv(struct	sta_priv *pstapriv)
 		spin_unlock_bh(&pstapriv->sta_hash_lock);
 		/*===============================*/

-		if (pstapriv->pallocated_stainfo_buf)
-			vfree(pstapriv->pallocated_stainfo_buf);
-		}
+		vfree(pstapriv->pallocated_stainfo_buf);
+	}

 	return _SUCCESS;
 }
--
2.32.0

