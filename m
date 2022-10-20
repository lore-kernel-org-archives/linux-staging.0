Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710997B;
	Thu, 20 Oct 2022 21:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666301469; bh=8t4ENBloG+Phz6je0+udV+4mU06+0QlLLRBDLTgn02w=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=admlx2Nzxjt+bxTrkhm1Y5ZvwkIpI7ySwaICBatU4Dk4GndaGdvcdTBNiJ1YsDUU2
	 eawjmAoBGpph/Gzxa2kjXlIFaQFPXQz4qKWBA3xtooSDw+57jI014OZ0uLji0Hboun
	 k8yZoRSSrNfDkTBw5RSef4KaMDo29zrBtA6XxMqo=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
	via [213.182.55.206]
	Thu, 20 Oct 2022 23:31:09 +0200 (CEST)
X-EA-Auth: u+4RCJmYiwvXpI1NQdr//izPrZSCt2itNnWJ85yVDcFQOVL6aLGVwyZAGV5UEcK14QOVeNeb5t9gxm5KJt1hVQgwaHzLwGpF
Date: Fri, 21 Oct 2022 03:01:05 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, paskripkin@gmail.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kumarpraveen@linux.microsoft.com,
	saurabh.truth@gmail.com
Subject: [PATCH v4 08/11] staging: r8188eu: replace leading spaces by tabs
Message-ID: <c32b702c61ea3367d60f0a4c2443093d6ce45a69.1666299151.git.drv@mailo.com>
References: <cover.1666299151.git.drv@mailo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1666299151.git.drv@mailo.com>

Spaces are prohibited as per the Linux coding style guidelines. Replace
those by tabs wherever possible to improve code alignment. Error
reported by checkpatch script.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---

Changes in v4:
   -- None.

Changes in v3:
   1. Patch newly added in the patch set.

 drivers/staging/r8188eu/include/rtw_cmd.h      | 10 +++++-----
 drivers/staging/r8188eu/include/rtw_mlme.h     |  2 +-
 drivers/staging/r8188eu/include/rtw_mlme_ext.h |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_cmd.h b/drivers/staging/r8188eu/include/rtw_cmd.h
index 61fb523afb08..4b6a91aefc1e 100644
--- a/drivers/staging/r8188eu/include/rtw_cmd.h
+++ b/drivers/staging/r8188eu/include/rtw_cmd.h
@@ -592,14 +592,14 @@ struct setratable_parm {
 };

 struct getratable_parm {
-                uint rsvd;
+	uint rsvd;
 };

 struct getratable_rsp {
-        u8 ss_ForceUp[NumRates];
-        u8 ss_ULevel[NumRates];
-        u8 ss_DLevel[NumRates];
-        u8 count_judge[NumRates];
+	u8 ss_ForceUp[NumRates];
+	u8 ss_ULevel[NumRates];
+	u8 ss_DLevel[NumRates];
+	u8 count_judge[NumRates];
 };

 /* to get TX,RX retry count */
diff --git a/drivers/staging/r8188eu/include/rtw_mlme.h b/drivers/staging/r8188eu/include/rtw_mlme.h
index 7658f864136e..ebf7168a7ef9 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme.h
@@ -528,7 +528,7 @@ void rtw_indicate_scan_done(struct adapter *padapter);
 int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie,
 			uint in_len);
 int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie,
-		        uint in_len, uint initial_out_len);
+			uint in_len, uint initial_out_len);
 void rtw_init_registrypriv_dev_network(struct adapter *adapter);

 void rtw_update_registrypriv_dev_network(struct adapter *adapter);
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index be470f913a94..413b94e38744 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -449,7 +449,7 @@ void ERP_IE_handler(struct adapter *padapter, struct ndis_802_11_var_ie *pIE);
 void VCS_update(struct adapter *padapter, struct sta_info *psta);

 void update_beacon_info(struct adapter *padapter, u8 *pframe, uint len,
-		        struct sta_info *psta);
+			struct sta_info *psta);
 int rtw_check_bcn_info(struct adapter  *Adapter, u8 *pframe, u32 packet_len);
 void update_IOT_info(struct adapter *padapter);
 void update_capinfo(struct adapter *adapter, u16 updatecap);
--
2.30.2



