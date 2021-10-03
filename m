Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F333FED
	for <linux-staging@lists.linux.dev>; Sun,  3 Oct 2021 16:18:35 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id y1so9491397plk.10
        for <linux-staging@lists.linux.dev>; Sun, 03 Oct 2021 09:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=wiTJBRq4UGMODPvYEyNV3oB8d3MZ6hINzZgUpTIRnFg=;
        b=IGbTGR7afZSkCOXJtiwKxmYnVPo/YCvglOkp8k+Idl5bj3Nx33PZAKES7kGhM8sr+P
         24JXDMRDwgaYISibW5B6jV1QN1YT5Ne0hvrSwoNO/EzxX8jrgo7z7S+vvchMLumyrIbi
         NKJbzfMFAjz8Gg6Yn0PH2v9PbJ20n8mxtQ84jLlPKAXIv5sYGZST6zS0G4BcmVLbLT6h
         2ai+1WmyO9XbCxTuR0pO/V4mUQna8jW/Ybc0mfNkBcISSHvxzrh7k4FlNVqxMjNOV6a4
         cqtu99qOjMO42zyV+bLV6p5gP7mtHVCXvGtnNQSzYdwkKZDY98T1g5Mw6i9VmGDYV+2d
         c0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=wiTJBRq4UGMODPvYEyNV3oB8d3MZ6hINzZgUpTIRnFg=;
        b=cKIBKvCxaaG7qk7CispfGHloxeh+V+djg+pWI4uUzs7EgLoAU5MQolNPsGXQvsQEBt
         1Y6Fdvbq3SUaAzZP0VYXnd8iVFqGpCJ4LjROHQZGYAFxU7dHmaoLnPnjt4bSwqDPPm/G
         O+4EbWGWzJLJ4iIgySbH2B3sKTxbTlYtG5IBDi+gExX1gqGML0E6Lp2Cmd6JOec6PWdf
         cSfdNTzuIuX1IuxSc0YPTwb2THwkpgubptUV6aYJG0H/auJTnukFQODGELU70XJy/jTM
         u1ix1y6T7NE6i0JgUbaXJzhlrW9YPvI5R1JZkG6AehPDjQkP9cNcYRnX0Pcy1++WYost
         1IPw==
X-Gm-Message-State: AOAM531OT33b2b6bEEvqlR1B1VTZ/rStOGVk3BBT7k7l6jP15fJptYn5
	RLltw9g5L03L0+6rLCCnwaw=
X-Google-Smtp-Source: ABdhPJz9pjwAe9gvabiDAnDEiwL4XOcxppxKmiMf3zIyhLzVJ9TemVfVQcAvo1qW1L2B2ABPQ1wAYg==
X-Received: by 2002:a17:902:7d89:b0:13c:a5e1:f0f1 with SMTP id a9-20020a1709027d8900b0013ca5e1f0f1mr20512815plm.24.1633277914803;
        Sun, 03 Oct 2021 09:18:34 -0700 (PDT)
Received: from user ([223.230.43.197])
        by smtp.gmail.com with ESMTPSA id h13sm11364173pgf.14.2021.10.03.09.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 09:18:34 -0700 (PDT)
Date: Sun, 3 Oct 2021 21:48:28 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: gregkh@linuxfoundation.org, fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com, hdegoede@redhat.com, marcocesati@gmail.com,
	fmdefrancesco@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: rtl8723bs: core: remove reassignment of same value
 to variable
Message-ID: <YVnX1HIYoisW621x@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove reassignment of same value to variable pstat->auth_seq.
On if (seq == 1) assigning the value 2. At the end of if statement
also assigning the value pstat->auth_seq = seq + 1 that is again
assigning the value 2.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 3ee4d35ca8d7..059cd85f4b03 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -808,7 +808,6 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 			pstat->state &= ~WIFI_FW_AUTH_NULL;
 			pstat->state |= WIFI_FW_AUTH_STATE;
 			pstat->authalg = algorithm;
-			pstat->auth_seq = 2;
 		} else if (seq == 3) {

 			p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + 4 + _AUTH_IE_OFFSET_, WLAN_EID_CHALLENGE, (int *)&ie_len,
--
2.32.0

