Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C89D28EA
	for <linux-staging@lists.linux.dev>; Sun,  2 Apr 2023 09:51:46 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id ek18so106324412edb.6
        for <linux-staging@lists.linux.dev>; Sun, 02 Apr 2023 02:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680429104; x=1683021104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VaeBDPkSiTEyNdN0rUscDp5HyS5CgrVs8mEE78XtpGY=;
        b=m11NQ93My1CKSjCNRpFIoKODHOqd0MpOWOR7t4H6N1NO7dt1q4UiU98zUOXEi9iCwA
         awQ6J4BXGgVAEfH7b4sYbC10/RVwMeTSjRM5JdG7gpxSYC4ZxxBMZSee5HKAG47mca17
         ltIG5/7kpiUHLHtiHXA2qNUEQ8cP6clXZM8we4dH5rG3dYJIl0hhS3EJeQPObh/M24Mh
         BTbITuCR0msP4rZ1Z/4LU479HmI+BC+U45/0A08gsx0zOEtDAzI9OwJRs+Lndmw7uazh
         D9N+HPMlkPqf19ornTNxVJExAjHKwpl+20TGPYEESHRtFCaw6BKEDM22rsF2GOrVdchl
         M1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680429104; x=1683021104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VaeBDPkSiTEyNdN0rUscDp5HyS5CgrVs8mEE78XtpGY=;
        b=b1Rn0TsfWjK6Lm9upiEuttubxsN9ej0fL408Fp3FWDPcbYZmmuQ0tgQwbBZdrtXuyA
         YrPOPE3bnGkz7dKYqn1DhdQU5GzXypm4gQ3jRvVEB4B5xygW9MdKD53KINTDqxFiyGRf
         SxudLClaHxxfax0vIQ0eYGqX9Y2+AW53fNXXXuidpwQ1lE82dFUpsliy0Q7blXE6TXtZ
         5gEfpGMqO69gs0O+RXFJL8e3zhU1NgzFeNJvdXlsGv2zpe9BfCT4ZVcg7l/WmQ3bAac4
         deG9k6L6iVDaqRC0VDnuHdCXnz9xzaF0OnXOuBUmxvZ4QZzHOrsM7qXH8LjqI8hM2p7R
         hj9w==
X-Gm-Message-State: AAQBX9f5KQCYQQmhHTUshmWpoDv8bn5ztWsDzn3M9MimAemTQBPNDjKQ
	maPIwtuxRyD8oRY0GMcsmPo=
X-Google-Smtp-Source: AKy350ZqQ0Kj2HWD+AtYdnNQ8V2cqxvVTdwF6CPMkzO2spgWeg9jAVZj/ZCVRcwzVdoJWiLuNlmglg==
X-Received: by 2002:a17:906:2098:b0:8d2:78c5:1d4e with SMTP id 24-20020a170906209800b008d278c51d4emr9637967ejq.5.1680429104567;
        Sun, 02 Apr 2023 02:51:44 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id gl25-20020a170906e0d900b00929fc8d264dsm3103867ejb.17.2023.04.02.02.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 02:51:44 -0700 (PDT)
Date: Sun, 2 Apr 2023 11:51:42 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] staging: rtl8192e: Remove RF_Type from
 .._dm_tx_update_tssi_weak_signal
Message-ID: <95744a9d271723b44b92465809d092f90edf9bc9.1680427945.git.philipp.g.hortmann@gmail.com>
References: <cover.1680427945.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1680427945.git.philipp.g.hortmann@gmail.com>

Remove RF_Type from _rtl92e_dm_tx_update_tssi_weak_signal and
_rtl92e_dm_tx_update_tssi_strong_signal as it is unused.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1->V2: This patch did not exist before and was added because RF_Type
        was used here but left uninitialized by later patches.
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index b5f4d0230da7..258ea66ab2fd 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -475,8 +475,7 @@ static u8	CCKSwingTable_Ch14[CCK_TABLE_LEN][8] = {
 #define		Tssi_Report_Value2			0x13e
 #define		FW_Busy_Flag				0x13f
 
-static void _rtl92e_dm_tx_update_tssi_weak_signal(struct net_device *dev,
-						  u8 RF_Type)
+static void _rtl92e_dm_tx_update_tssi_weak_signal(struct net_device *dev)
 {
 	struct r8192_priv *p = rtllib_priv(dev);
 
@@ -495,8 +494,7 @@ static void _rtl92e_dm_tx_update_tssi_weak_signal(struct net_device *dev,
 	}
 }
 
-static void _rtl92e_dm_tx_update_tssi_strong_signal(struct net_device *dev,
-						    u8 RF_Type)
+static void _rtl92e_dm_tx_update_tssi_strong_signal(struct net_device *dev)
 {
 	struct r8192_priv *p = rtllib_priv(dev);
 
@@ -610,10 +608,9 @@ static void _rtl92e_dm_tx_power_tracking_callback_tssi(struct net_device *dev)
 				return;
 			}
 			if (Avg_TSSI_Meas_from_driver < tssi_13dBm - E_FOR_TX_POWER_TRACK)
-				_rtl92e_dm_tx_update_tssi_weak_signal(dev,
-								      RF_Type);
+				_rtl92e_dm_tx_update_tssi_weak_signal(dev);
 			else
-				_rtl92e_dm_tx_update_tssi_strong_signal(dev, RF_Type);
+				_rtl92e_dm_tx_update_tssi_strong_signal(dev);
 
 			priv->cck_present_attn_diff
 				= priv->rfa_txpowertrackingindex_real - priv->rfa_txpowertracking_default;
-- 
2.40.0

