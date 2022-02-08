Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95962C80
	for <linux-staging@lists.linux.dev>; Tue,  8 Feb 2022 18:04:38 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id l67-20020a1c2546000000b00353951c3f62so2299262wml.5
        for <linux-staging@lists.linux.dev>; Tue, 08 Feb 2022 10:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cdlsppHiLZTOsM13z6W1Cp7fdsqKE9BaC7RMZ/J9wUY=;
        b=aiNV3vVZiXuLBKybeAPgsiWUsvt6pmq4xQAxUtys8cJQTrTNpeXd03r0zhH3GajZad
         LcGU8gmuoCruJvOB0A9A339LxEdh94m6W4k6iLGT3X1WpvJ9m4xmHbwCT/ewrUNiwMeM
         /TVG2P6AB3OQKgXJdxPxAVXCEtrGIUbWn1cTk6s7KGAWjQTEvL7rl9c33VrkMiW/B5T3
         NapcckAB7O2wMj2hE8tz5D6fOpU2QhRLkqsr92N4HK54h+aNZ40nIh0CBCrZTP/jcu65
         dO6B+ZuOIB009eV4MrogSOLrOokYmQWIopdmH02laCxzeRsy7ZKlyQrZsJjZhzeEi3pz
         qIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cdlsppHiLZTOsM13z6W1Cp7fdsqKE9BaC7RMZ/J9wUY=;
        b=7Xrj2I9XU+QkPhiui+zks5BD+yFVojA/0+/LgY6daxrw8tO6jgjSsJhi82ecrpYFl9
         bw+Lwg1WuvNtMjTnnlpkBaPdaXKl7u/5/tFORsS0cXYVDLYmsrSBhi4FBez/QJ0TRcmt
         a1B2QMTn+ckN1eVjKDEAmujRt1huUuRpSRhGyFnsY+kzRVDNl2j4ogPFtb+srw1plbHg
         zr4SwVG8zQp7Ng1by87OnKe2COGCUah1uByDgE4Prygha3IiJEesLnvQRwhbDKtS9iQK
         82hnG9qcQ5ELziiPQ5MdEub/A6hMlzNiETYo4XAZ9iss/NoqvTzesvU2jroKmO8e4lNy
         FH1g==
X-Gm-Message-State: AOAM533ugjYrcV073PeMGq62UdIh9m4qSBpRrYSL5SmEXOD8kriUPICZ
	s69kcWeNN8yiTQYKzddTOj0=
X-Google-Smtp-Source: ABdhPJwDfPSnlQNtt4HwMMQ8J71qo1hxlwHsxo4zZE5//41TRPJYCa2mS1yiwpIBiagXaSHHrQPLEw==
X-Received: by 2002:a7b:c74c:: with SMTP id w12mr2083514wmk.140.1644343477019;
        Tue, 08 Feb 2022 10:04:37 -0800 (PST)
Received: from localhost.localdomain (host-95-245-2-16.retail.telecomitalia.it. [95.245.2.16])
        by smtp.gmail.com with ESMTPSA id n26sm3176872wms.13.2022.02.08.10.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 10:04:36 -0800 (PST)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v2 1/2] staging: r8188eu: Use sizeof dereferenced pointer in kzalloc()
Date: Tue,  8 Feb 2022 19:04:25 +0100
Message-Id: <20220208180426.27455-2-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208180426.27455-1-fmdefrancesco@gmail.com>
References: <20220208180426.27455-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

checkpatch.pl emits the following warning:

CHECK: Prefer kzalloc(sizeof(*pcmd)...) over kzalloc(sizeof(struct cmd_obj)...)
+       pcmd = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);

CHECK: Prefer kzalloc(sizeof(*psetkeyparm)...) over kzalloc(sizeof(struct setkey_parm)...)
+       psetkeyparm = kzalloc(sizeof(struct setkey_parm), GFP_KERNEL).

According to the above "CHECK[S]", use the preferred style in the two kzalloc()
of rtw_set_key().

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

 drivers/staging/r8188eu/core/rtw_mlme.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 038bddc361c3..f5b2df72e0f4 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -1600,12 +1600,12 @@ int rtw_set_key(struct adapter *adapter, struct security_priv *psecuritypriv, in
 	struct mlme_priv		*pmlmepriv = &adapter->mlmepriv;
 	int	res = _SUCCESS;
 
-	pcmd = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
+	pcmd = kzalloc(sizeof(*pcmd), GFP_KERNEL);
 	if (!pcmd) {
 		res = _FAIL;  /* try again */
 		goto exit;
 	}
-	psetkeyparm = kzalloc(sizeof(struct setkey_parm), GFP_KERNEL);
+	psetkeyparm = kzalloc(sizeof(*psetkeyparm), GFP_KERNEL);
 	if (!psetkeyparm) {
 		kfree(pcmd);
 		res = _FAIL;
-- 
2.34.1

