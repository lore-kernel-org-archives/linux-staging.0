Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1555F
	for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 13:37:21 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id o16so16846387wrn.0
        for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 06:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0VJDdimOASlABSC1RBuEQR2X3ynq9QcsKNWWxPBD5BU=;
        b=grnhXnnus9bm/r5OBYC8EWhT8s2B7fuxlLdJPhYwq5O9vkv9zt7rpxemdY26NU4TM7
         /WvPKDuTosvsPrISeDY7hTXbHx5fP/P1jxlT8tRumnPryEjJQ61hleXvB2aiQCNMmclB
         Ihj4YfyKIT+oyLR9tai95xSQvg1Cn6F4cfuhYHvpwLrF1fj8p/Th54HciKHfl42c4+ok
         6ZJ5vmiclLTvefVmerUdi4EZO43mFNAzkr57SZGgKzVcQzDMBfg5RDfxN8p1RaH6EQyu
         6Aitxa4BdjQWyFG6+fdutacKfvS3//AYSaEJX5DVspMD63392ml2c5zRuBc0yCEGVUF2
         GHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0VJDdimOASlABSC1RBuEQR2X3ynq9QcsKNWWxPBD5BU=;
        b=Zt37O0Qp9cO1alKu2l9HlXaMQ28l6FI1YY0/31DbDhCwTdp+flBP/e93kphQhPF/uV
         sx6Uf6L8iZvfpCubAnnfR7eaoYi3v5jwxE4cDNNZk+QnnyXbK64FfIasW8kvK6sytD0h
         wwXDLHqMLvo8LNYxRvXrRrhB0EZ+ZTEqWc2c2m0IlMw9uREuIcPpkwsRYHyBEGbfNvTL
         iJs2BeE5IORPZy6lPA6isYq26f2yhnV3lXl7sdkJTTlVAtQw1/+YWQ68Ft0AfSfytSyH
         kpE6aXWsTwzxTr/hPuigoPQCHb5NQ7AmL07X/vijSlL1pDE6cBd6wCCmV8aBx/MmyKud
         j8Fw==
X-Gm-Message-State: AOAM530VLQmuNZjfgdF+JnTRZsWfwThvw63BKeTeMaoGphRxOMmoEF8N
	vRlbSS9//Jm/atFDlfO95rY=
X-Google-Smtp-Source: ABdhPJzAvqz4uoAKqQ7KuR1BBr5r1jHTCzCBvtWZSKWAmbKtuVtsGBu0EypSwuOv9h8Vshp4DlsIMA==
X-Received: by 2002:a5d:4d09:: with SMTP id z9mr17930939wrt.426.1616420239764;
        Mon, 22 Mar 2021 06:37:19 -0700 (PDT)
Received: from gimli.cesven (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id d204sm17091770wmc.17.2021.03.22.06.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 06:37:19 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 11/19] Staging: rtl8723bs: remove useless structs in rtw_security.h
Date: Mon, 22 Mar 2021 14:37:09 +0100
Message-Id: <20210322133717.17797-12-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322133717.17797-1-marcocesati@gmail.com>
References: <20210322133717.17797-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unreferenced struct in include/rtw_security.h:

	struct sha256_state

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_security.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index 0d3f7d46c33f..60b05a620eee 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -193,12 +193,6 @@ struct security_priv {
 #endif /* DBG_SW_SEC_CNT */
 };
 
-struct sha256_state {
-	u64 length;
-	u32 state[8], curlen;
-	u8 buf[64];
-};
-
 #define GET_ENCRY_ALGO(psecuritypriv, psta, encry_algo, bmcst)\
 do {\
 	switch (psecuritypriv->dot11AuthAlgrthm)\
-- 
2.30.2

