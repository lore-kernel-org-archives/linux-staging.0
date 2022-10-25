Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E917479
	for <linux-staging@lists.linux.dev>; Tue, 25 Oct 2022 17:06:36 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id m2so7467409pjr.3
        for <linux-staging@lists.linux.dev>; Tue, 25 Oct 2022 10:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hiKyw0R3gnXw2JRFe0MILoD1CNInLwVAP+DIRRMQdcA=;
        b=Z7vGHc/RsXVHwy7Ey6NTTNIp8n1OPafSnE3d8E5xjPk9UHoIDKbAzQsIH+L0HPB1CG
         JVeAZhvibSS2rM1cfyIkte/VDA0Gob21awPRJ4gh+fNCbopbdU8Rokphv889+p3+cdTi
         Q00weE1M/4V7W8SWmGb+uhxOzb4TLqsG7gmI+d89rgmlt7ypEN52LF02rqpg6pDOzUH8
         kqCg1VM2ReCt04f+NxeuyGtXS8cuH1Mjlk3KDRTNVEeYIaN1aYtxjewE+GbkuO8nW12u
         bxlC6GySaycF/qvT+8rrZTOcOxy46CAdUEhJwGdPlf2E0lkbqMyofZe0zKo2AoiybTrK
         2iBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hiKyw0R3gnXw2JRFe0MILoD1CNInLwVAP+DIRRMQdcA=;
        b=mk3S8mHFpsFooBk8uqSrWOyjlh3IcYZXIq4a3R4ZGBXRq9UI9JpAc3FEzLtigheB/k
         ypzIa2248lHf9CVis9zUPzcsWeLgDaL1e6bZVepoOIy4Sg4mUZj9bvG7/XkksqnD2o0U
         Ds/K83Dw1nK8dmPBtX77zyGEIk3hTn7ZqZ14SFB+cmI1egWdnaiBxHuACG7B/Q7Vt5ft
         IV8BwTjQvxw0U5LSSWcBiCHAv+HkZ2BQY3BRorATW81AO+MwaD58uxEbsnKSUicXbDsg
         WvTdvSh7I49UToL2jFNlrrpkk8pCkffrTbZ/MALpmITFXAVB7iCt9KPN3G+LL02Zpxtd
         KYag==
X-Gm-Message-State: ACrzQf3VOzzpKf8AqsaCmwHyAve2C4FI2ETnslvFSDIbJ7E66D7WCmF/
	kwBT2l1YFktzMMIaoHlFfD5x4pPFhS3DWLBW
X-Google-Smtp-Source: AMsMyM5aYy3Gx70pUtb8pyS1Il1ZnepAErbJcZC9a68qBZjjd17/uP8DaRcoOum87j9I9/uwbQUgyg==
X-Received: by 2002:a17:90a:1b44:b0:213:1035:f913 with SMTP id q62-20020a17090a1b4400b002131035f913mr12926951pjq.133.1666717595494;
        Tue, 25 Oct 2022 10:06:35 -0700 (PDT)
Received: from uftrace.. ([14.5.161.231])
        by smtp.gmail.com with ESMTPSA id a1-20020aa794a1000000b0056bcf0dd175sm1592373pfl.215.2022.10.25.10.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 10:06:35 -0700 (PDT)
From: Kang Minchul <tegongkang@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kang Minchul <tegongkang@gmail.com>
Subject: [PATCH v3 2/4] staging: r8188eu: remove unnecessary vaiable in rtw_recv
Date: Wed, 26 Oct 2022 02:06:19 +0900
Message-Id: <20221025170621.271903-3-tegongkang@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221025170621.271903-1-tegongkang@gmail.com>
References: <20221025170621.271903-1-tegongkang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Return _SUCCESS directly instead of storing it in a variable.
This can prevent cocci warning as follows:

  Unneeded variable: "ret". Return "_SUCCESS" on line 1516

Signed-off-by: Kang Minchul <tegongkang@gmail.com>
---
v2 -> v3: rollback to v1 because v2 caused error by kernel test robot
v1 -> v2: made amsdu_to_msdu into void function

 drivers/staging/r8188eu/core/rtw_recv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index bb5c3b3888e0..9e98aea09583 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -1415,7 +1415,6 @@ static int amsdu_to_msdu(struct adapter *padapter, struct recv_frame *prframe)
 
 	struct recv_priv *precvpriv = &padapter->recvpriv;
 	struct __queue *pfree_recv_queue = &precvpriv->free_recv_queue;
-	int	ret = _SUCCESS;
 
 	nr_subframes = 0;
 
@@ -1513,7 +1512,7 @@ static int amsdu_to_msdu(struct adapter *padapter, struct recv_frame *prframe)
 	prframe->len = 0;
 	rtw_free_recvframe(prframe, pfree_recv_queue);/* free this recv_frame */
 
-	return ret;
+	return _SUCCESS;
 }
 
 static bool check_indicate_seq(struct recv_reorder_ctrl *preorder_ctrl, u16 seq_num)
-- 
2.34.1

