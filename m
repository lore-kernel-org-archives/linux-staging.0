Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0E23FC3
	for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 12:04:37 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id b6so22048013wrh.10
        for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 05:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C0jDxgei4bh80NCLp4kQich3bBzgtekPwpab1aROVMA=;
        b=BBgEqipmitPtbVUNsXX2Kq5QeHyTLZgi7d0daWdiZaIk5olsLqbMGRgC9a1yWcmqx5
         lEd6FxiPRPWbd6F6YZfV6vFWQhmXTs7n52t8XBHwAB9OGygaIWa09y/wdSr1vRgf4By1
         e6MStKrqu8UiEtJ3aM1sB4LChxNWa3PKkvqZWEaiVf6xao1U6RLMa5+IVw95MaOvPwpd
         5VgbZrG9UlcGIYBUA3SUjknQQf5Yab4Qc/JX0/5y2vGI2vD648ZYvCMnFXRnU5Jb1eqk
         0TfH34FHkIq1m3992g39rcsmZS0hkNJoGl2DNPru9PQTekTeXasUFi7AV6tcugUXgB7r
         Ug0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C0jDxgei4bh80NCLp4kQich3bBzgtekPwpab1aROVMA=;
        b=kKxhuaXIFuCJ3V7LQBxwfHpKZ3kmZ0NgMoG1yaz4/DFqLC00RjJAWajO8M3onInvov
         H/BGJCOXqymbszVuu/xAZKwim5H/oxHIy4yo7KLLNa9VPVK/n0smrKnoBgvjTk8R36jG
         at8ARvrafJkYC3nIBaAN6zpTS3txuOuconf2hWMwUzpaIbV+Tw8NDgbxlvRjX6J2U9Nu
         TRMqtb2T+X8p5fFazQr7mkvHTOeAbFhu8ndY/txGfsQza8pPT8DobVjfUtyAA/A9LZAV
         EAhGbXOo4LCxktKNETXR26b3N6AL2yGWQ4RkRP3DK7cwDdPY5hVzgCguSnvyMnzF/Wia
         oJ5w==
X-Gm-Message-State: AOAM530VHCXfxTwiaBkBxxFe8Cv1WvM+yKtJrHIfLVyRh1hcfZ+ZsoQs
	3QQrRcH1rE9SWPL4DxhCvoo=
X-Google-Smtp-Source: ABdhPJzU9Y5T9Rt+/Mx31P67fcJNFbQxxad4gcD0jDuEpao0l6WJ7dsEED2vVJOjcSrBYeX9zIpWbg==
X-Received: by 2002:a5d:6301:: with SMTP id i1mr24714033wru.423.1630325075524;
        Mon, 30 Aug 2021 05:04:35 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::16fa])
        by smtp.gmail.com with ESMTPSA id f18sm13184195wmc.6.2021.08.30.05.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 05:04:35 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/8] staging: r8188eu: ensure mac address buffer is properly aligned
Date: Mon, 30 Aug 2021 14:04:14 +0200
Message-Id: <20210830120420.5287-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210830120420.5287-1-straube.linux@gmail.com>
References: <20210830120420.5287-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure the mac address buffer in struct eeprom_priv is properly
aligned for use with functions from <linux/etherdevice.h>.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/rtw_eeprom.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/rtw_eeprom.h b/drivers/staging/r8188eu/include/rtw_eeprom.h
index 9f8a9c070339..fb591a764dac 100644
--- a/drivers/staging/r8188eu/include/rtw_eeprom.h
+++ b/drivers/staging/r8188eu/include/rtw_eeprom.h
@@ -99,7 +99,7 @@ struct eeprom_priv {
 	u8		bautoload_fail_flag;
 	u8		bloadfile_fail_flag;
 	u8		bloadmac_fail_flag;
-	u8		mac_addr[6];	/* PermanentAddress */
+	u8		mac_addr[6] __aligned(2); /* PermanentAddress */
 	u16		channel_plan;
 	u8		EepromOrEfuse;
 	u8		efuse_eeprom_data[HWSET_MAX_SIZE_512] __aligned(4);
-- 
2.33.0

