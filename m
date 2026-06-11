Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A50E3659E8
	for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 08:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781165831; cv=none; b=UqfQHcvvqAOqD874ck3yLaJzfvJFvk4GG4CrVdqdYiphbF2d580NEC0LxZ+Yp8Q60SMurruD/upvXcs9nMkaXh9b0XY7qx4KV9+RJCjczgD/lmsYBI88SBAh2rZr8/jQZCLjL20gX23qNwPmPcm7wlrlKKjKoeO/VkhYipSAjlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781165831; c=relaxed/simple;
	bh=5lwxE1eiQ8BdMzV1W3JSnu+vT9WqfqvAXh+SRR0c6ns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a2UVGbGptRHjtlk0x8xK29sJ661tmXOz4NYndj4QttAtelejp39NqePXU+zyJTpJjAgVuxfhgCgwSSVvw7zUi6QgbowrE1wULIbavw7D2O8sgH0FjbfCeULHmCJBhL85ZKVzH0WccPtlnPOoHjFB4BpkMoIUHKfAvceATUNiuFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ame5suZB; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ame5suZB"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2bf332e9457so8208965ad.1
        for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 01:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781165830; x=1781770630; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lc700vchgjw3eA+L9PLOMFS3yoggGFBOrwECyM3kaKw=;
        b=ame5suZBQAmnZkaOTCyoufFtUN1z51+8N9+ZnB9Jstds7LjFIxmWB3sRnpAXIYZQ01
         bBabM4RdRelLPKSb7IVfhVx/9t/sUmhAJWMRQklOcU186F0sdodUi0QngvqKuJ+mF8ev
         PS053vkQq7NiPTDg0WftKcFImF2W3EDxNSwMiqDmtFdPH+0rn+mOjL2oF+IA55rHPCGB
         28KAxelKkl32SCCL02eHLwlpQF+JlF4bwzUie99vDKA5bSgLrQcqC31lGf/Qmv1HVJyC
         11H6yyrYvjd9FpJhCB+eI9/EJOm/iXIk+Rzy9BJ7T0QDkJvV4xaAepmbmjxxE2BNmvpL
         4Wxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781165830; x=1781770630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lc700vchgjw3eA+L9PLOMFS3yoggGFBOrwECyM3kaKw=;
        b=XR31qg9nu/ItieKqLmB2NiQgtDFYjgo/GrGGOoZNH3wY0Mad2jrU9F0oIfcwNmM3RD
         Fu+hSA4tFPD04KypoY2Fx55PYlMD9X+iM5fVGbABUIweCpD93tEzjOsChpthz4tGXq+/
         frw6IVIP0QFn401ZNgkg04EPBjh8GwvEH573qGtQgt6VGSO9hcH7nujgWdQo3CYIpYck
         j99eB3FTWGgPWh9Zk7BgVNC7f/BM3f4hqhq1zvgmxKfBDSvKEBDS9CC6JMD6s6ah6/12
         FOS17upc9tcpOiiNaJV1aztDLKSrnBFmbjSrOmfJx4wW7/i8sBC5KWRDNvw7dcoks61j
         VgVQ==
X-Gm-Message-State: AOJu0YyOhKJpeTHHrl2h2c4QrugBT9e9GHzvfi+9j1r59IQV47yIK5cc
	7w6JLWVdvZ/dJuuxYWa59G2YEezCWGOxCBVqNaNl99KzidOkYjieyBch
X-Gm-Gg: Acq92OG4wJ4/4ziLktGSNEih4ZEsKcTSVxwNLfrWfrpYOxd6a40mzGYcengtz51nkfF
	Xze9/iEPu3AsGAzWgkoFf8HOeQ7QgJYMSOf3Dgu64oJdY3bRnptluodtHfcUM5PbVUltCGk5QwN
	NLR0qtZM0pOKCFnudrJKOCmPC3ZjxoO0SaB2h6QgKqpqLkjR/yQiKb3gADgOvrq0h7OrIDYDKFL
	JFN1moDbi+fRNutN2N/q9MjcPK2AXhHte3vxBW2TQPrldy2/HqlL7gg4VupkJ3hDfrvPDqYH992
	beegH93+3b0P1tp8AQgo5EmsgT3Fmkq3yMdRk9DTjv1OowlrVbzS0imaNi9kUnLgOEb9eKiVBH3
	yqIRs1+AejflsOnSiQTukWHyG5OdpMEKbutJU89h4pYXlAVgdBiK0DmWuZx3Kx2/gKTdLSNTbIg
	ZK/PBxHlnAhbiNLkDUZ4kneGhybBUeV3ZF0jXtLaG9nU1V4ps8
X-Received: by 2002:a17:902:da85:b0:2c0:ab82:6b98 with SMTP id d9443c01a7336-2c2f21a16e8mr11478035ad.3.1781165829782;
        Thu, 11 Jun 2026 01:17:09 -0700 (PDT)
Received: from chenyou.. ([140.116.226.142])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e86dsm276526735ad.8.2026.06.11.01.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:17:09 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrei Khomenkov <khomenkov@mailbox.org>,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unused netdev format/arg macros
Date: Thu, 11 Jun 2026 16:16:15 +0800
Message-ID: <20260611081644.1553264-2-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611081644.1553264-1-chenyou910331@gmail.com>
References: <20260611081644.1553264-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NDEV_ARG, FUNC_NDEV_FMT and FUNC_NDEV_ARG are defined but never
used anywhere in the driver. Remove them.

This also fixes a checkpatch error:
ERROR: Macros with complex values should be enclosed in parentheses

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 drivers/staging/rtl8723bs/include/osdep_service_linux.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_service_linux.h b/drivers/staging/rtl8723bs/include/osdep_service_linux.h
index 2ec54f9e1..c8274da94 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service_linux.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service_linux.h
@@ -98,10 +98,7 @@ static inline void rtw_netif_stop_queue(struct net_device *pnetdev)
 
 #define rtw_signal_process(pid, sig) kill_pid(find_vpid((pid)), (sig), 1)
 
-#define NDEV_ARG(ndev) ndev->name
 #define ADPT_ARG(adapter) adapter->pnetdev->name
-#define FUNC_NDEV_FMT "%s(%s)"
-#define FUNC_NDEV_ARG(ndev) __func__, ndev->name
 #define FUNC_ADPT_FMT "%s(%s)"
 #define FUNC_ADPT_ARG(adapter) __func__, adapter->pnetdev->name
 
-- 
2.43.0

