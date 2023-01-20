Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB4F569E
	for <linux-staging@lists.linux.dev>; Fri, 20 Jan 2023 19:11:25 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id p133so5219242oig.8
        for <linux-staging@lists.linux.dev>; Fri, 20 Jan 2023 11:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=BFyYTpVG5ZzCzfnTs8oNkGAEsfN9nPz+uDFLXCK3bOc=;
        b=Ztw6p5ICi2lkwk8EqwAPw3IqQfXkqMLi7SBoOL1bqe8ExOT/EUCaUmLjxV3oPBf4yY
         3FNRQEnf3v+ILni/t00bpVIOe+kXTAzEDqZKOVRQrzNNlaiDzcCtWazBZ42hlzH/Xpn2
         MxTQr7zrtOgFN7yuR283M6S33WxgpVGggsdSvspaAYjemSUBozC9Crfg+MRkBI6xKCbJ
         +E90pozRoRwAr6CWiPMp8WgFowZMjqEJyvNwjArvdgYACf/sEtEEIBwq58397t1VbtPd
         6uMMBFrYnNsepKWCFajpnQfEkk8k/D11hzsT8RP2pt5l0lxvPeBNob+LADz81R35e8BE
         S21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFyYTpVG5ZzCzfnTs8oNkGAEsfN9nPz+uDFLXCK3bOc=;
        b=ONpBLniJ+zsOX9UOzrYVR9Nk5rMfIcnonsoAfDMdL7cVUvg1Hh6WS+peUzlTrUMc/S
         5OVU5NDscdVql0Jvw3P5kJv0FAklPQCtSSqYK6VuB2nGcXayvHMulxj95+kYVAICHZsY
         O5jJb7J5itMTwNwCOOKPpfsyveZO6OIeoRrSTGmsTl69jypfd5eO8wHx1nbp3IPiZCmO
         HJ0/47l57AGB+zsVH1xqLB6MFdMvuzJGKqAMG4qv+YIZpZgVXLH+HiNGF+65tgKF22xS
         K2lnUzRZ9u5C04tS4qD0N8ouH06n6uNsddLp+zdInSdxb8oJbemsmVT86fLZ5XhlLhu4
         ffrw==
X-Gm-Message-State: AFqh2kpayjz2NK2WnD1y/o9HBzzwp3uunqK8p4eAozKTX+SkuvIJzIs+
	isvtoSYvLFZSpWjbPgHVwWc=
X-Google-Smtp-Source: AMrXdXtXTrCPMZlTu+cC+8XlgcCVVJtyBbU5CtrCwyWsvX0/7hB7Rmtd51lEkRZkJOuLQ+8i+4g/Sg==
X-Received: by 2002:a05:6808:3b0:b0:35e:2b7f:daa6 with SMTP id n16-20020a05680803b000b0035e2b7fdaa6mr6789297oie.28.1674241884248;
        Fri, 20 Jan 2023 11:11:24 -0800 (PST)
Received: from localhost.localdomain ([216.130.59.33])
        by smtp.gmail.com with ESMTPSA id c6-20020aca1c06000000b0035763a9a36csm3684463oic.44.2023.01.20.11.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 11:11:23 -0800 (PST)
Sender: Larry Finger <larry.finger@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
To: gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Gaurav Pathak <gauravpathak129@gmail.com>
Subject: [PATCH V2] staging: r8188eu: Fix some endian problems
Date: Fri, 20 Jan 2023 13:11:19 -0600
Message-Id: <20230120191119.13163-1-Larry.Finger@lwfinger.net>
X-Mailer: git-send-email 2.39.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sparse lists the following warnings:

  CHECK   drivers/staging/r8188eu/core/rtw_mlme.c
drivers/staging/r8188eu/core/rtw_mlme.c:1197:49: warning: incorrect type in
					 argument 2 (different base types)
drivers/staging/r8188eu/core/rtw_mlme.c:1197:49:    expected restricted
					 __le16 [usertype] mstatus_rpt
drivers/staging/r8188eu/core/rtw_mlme.c:1197:49:    got unsigned short
					 [assigned] [usertype] media_status_rpt
drivers/staging/r8188eu/core/rtw_mlme.c:1275:57: warning: incorrect type in
					 argument 2 (different base types)
drivers/staging/r8188eu/core/rtw_mlme.c:1275:57:    expected restricted
					 __le16 [usertype] mstatus_rpt
drivers/staging/r8188eu/core/rtw_mlme.c:1275:57:    got unsigned short
					 [assigned] [usertype] media_status
  CHECK   drivers/staging/r8188eu/core/rtw_mlme_ext.c
drivers/staging/r8188eu/core/rtw_mlme_ext.c:6842:58: warning: incorrect type
					 in argument 2 (different base types)
drivers/staging/r8188eu/core/rtw_mlme_ext.c:6842:58:    expected restricted
					 __le16 [usertype] mstatus_rpt
drivers/staging/r8188eu/core/rtw_mlme_ext.c:6842:58:    got unsigned short
					 [assigned] [usertype] media_status

The second argument of rtl8188e_set_FwMediaStatus_cmd() needs to be in CPU
order, not little-endian; however, when it uses that value to call
FillH2CCmd_88E() the parameter must be in little-endian order as that
value will be sent to the firmware. Note that the conversion from LE to CPU
order was le16_to_cpu() rather than the correct cpu_to_le16.

The definition of FillH2CCmd_88E() is revised, and the proper conversion
routine is used.

Note that the original code performed one byte swap on the secong argument
of FillH2CCmd_88E(), and got the correct answer even though the semantics
were very wrong.

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
Reviewed-by: Dan Carpenter <error27@gmail.com>
Reported-by: Gaurav Pathak <gauravpathak129@gmail.com>
Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
---
v1 -> v2: Fixed typo in the Reported line.
---
Greg,

I intended this patch as an example for Gaurav, but as it has not been
resubmitted, I am sending it to you. If you thing he deserves to be the
author, then please edit the patch before applying. Thanks, Larry
---

 drivers/staging/r8188eu/hal/rtl8188e_cmd.c     | 4 ++--
 drivers/staging/r8188eu/include/rtl8188e_cmd.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
index 8310d7f53982..788904d4655c 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
@@ -193,9 +193,9 @@ void rtl8188e_set_FwPwrMode_cmd(struct adapter *adapt, u8 Mode)
 
 }
 
-void rtl8188e_set_FwMediaStatus_cmd(struct adapter *adapt, __le16 mstatus_rpt)
+void rtl8188e_set_FwMediaStatus_cmd(struct adapter *adapt, u16 mstatus_rpt)
 {
-	u16 mst_rpt = le16_to_cpu(mstatus_rpt);
+	__le16 mst_rpt = cpu_to_le16(mstatus_rpt);
 
 	FillH2CCmd_88E(adapt, H2C_COM_MEDIA_STATUS_RPT, sizeof(mst_rpt), (u8 *)&mst_rpt);
 }
diff --git a/drivers/staging/r8188eu/include/rtl8188e_cmd.h b/drivers/staging/r8188eu/include/rtl8188e_cmd.h
index 1e01c1662f9a..c785cf8ed683 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_cmd.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_cmd.h
@@ -85,6 +85,6 @@ void rtl8188e_Add_RateATid(struct adapter *padapter, u32 bitmap, u8 arg,
 void rtl8188e_set_p2p_ps_offload_cmd(struct adapter *adapt, u8 p2p_ps_state);
 
 void CheckFwRsvdPageContent(struct adapter *adapt);
-void rtl8188e_set_FwMediaStatus_cmd(struct adapter *adapt, __le16 mstatus_rpt);
+void rtl8188e_set_FwMediaStatus_cmd(struct adapter *adapt, u16 mstatus_rpt);
 
 #endif/* __RTL8188E_CMD_H__ */
-- 
2.39.0

