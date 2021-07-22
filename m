Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A279E168
	for <linux-staging@lists.linux.dev>; Thu, 22 Jul 2021 16:42:30 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id q13so4206363plx.7
        for <linux-staging@lists.linux.dev>; Thu, 22 Jul 2021 09:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pCFZoqp+BH8M6WvlQZlo0eVZuOKBtQAUn+OHR1du9kk=;
        b=hjOC/YjyNUBvsdhdgQf/IMUhlVQjfCsQ5NdHH7P0L4XV1zkJ/vSDMBMouZ+uPIsnui
         jFi3kvxxaGB1Z+yeNGMRUOFArKyXmNxrUOp0WGiSAji4yRFvQ/O+w/lOcnvjh+k2HJmO
         zmKBJvcV7zAUzR1zAOWJy/ZD4xIpAcThBvKd1Y9Ee6w8lphxV7Y/JlZqaH3JY+6apr1l
         AK+ccKq38i9/VihJJeqo8tnWwr3+IhhXd7RYS7UuOKA6bnnxXnXtH1/NqKLhOiH1uTKY
         B3BLGIKmE+JMfciZyC33WtNTUVhAMOlnQ1JsO5IwP/BGpAzrudOWtu1LIr2Klvnt/n9Q
         tp6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pCFZoqp+BH8M6WvlQZlo0eVZuOKBtQAUn+OHR1du9kk=;
        b=j2nxdzD+HJCJw0rrlE/vNgqrRGwfZLkYgcMX6x8cw/tDmTnSah3nTW/4A8ioO+zGAu
         uQ0tE33MiOGM97btt2WsURhwLyj91+g6qPld0kj8BFu1zYL9/kPMqE0nID5xLQxvoaj8
         0N4i7l1GVi48V0YW0zXuKlNL7LTXmp41AyhaTu7g45CpmkWJZYY0QbOVlWq7aidjt1yz
         euoRikZfm2qFhVU1/CS66K5O8RVQ+0TP7rIw1jkNoW5g9z1szBebmOau1VVyX368MqMi
         T3wOwwlhAHYChcAxKOPLRMRc+b47/LRMHtPGaEi0CsjW4m1qi+61BjO/LD1QNjdxt1Sb
         UE8w==
X-Gm-Message-State: AOAM530pAJ5Eg+IeU42O3XCa6zuQEJiMheumcJH9eR9/akHLIyxkLlDe
	Czdha1abbLVIHMybKN5hA/M=
X-Google-Smtp-Source: ABdhPJydFdXu9WSOKBA4rWcAem0aOZvpj191muPrFetwaIoQ4hkl3r9+itX6bS90WJMPBANYHwUK7w==
X-Received: by 2002:a17:902:a710:b029:12b:9b9f:c461 with SMTP id w16-20020a170902a710b029012b9b9fc461mr387306plq.59.1626972149968;
        Thu, 22 Jul 2021 09:42:29 -0700 (PDT)
Received: from localhost.localdomain ([103.238.106.236])
        by smtp.gmail.com with ESMTPSA id n33sm34135903pgm.55.2021.07.22.09.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 09:42:29 -0700 (PDT)
From: Jignesh Patel <jigs0101@gmail.com>
To: 
Cc: jigs0101@gmail.com,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Martin Kaiser <martin@kaiser.cx>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Ivan Safonov <insafonov@gmail.com>,
	Paul McQuade <paulmcquad@gmail.com>,
	Phillip Potter <phil@philpotter.co.uk>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8188eu: Line over 100 characters
Date: Thu, 22 Jul 2021 22:11:37 +0530
Message-Id: <20210722164144.377781-1-jigs0101@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Break various lines into multiple lines to respect 100 character width limit.
Reported by checkpatch.pl

Signed-off-by: Jignesh Patel <jigs0101@gmail.com>
---
 drivers/staging/rtl8188eu/core/rtw_ap.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_ap.c b/drivers/staging/rtl8188eu/core/rtw_ap.c
index b817aa8b9de4..b83d6da01b7c 100644
--- a/drivers/staging/rtl8188eu/core/rtw_ap.c
+++ b/drivers/staging/rtl8188eu/core/rtw_ap.c
@@ -254,9 +254,12 @@ void expire_timeout_chk(struct adapter *padapter)
 			updated = ap_free_sta(padapter, psta, true,
 					      WLAN_REASON_DEAUTH_LEAVING);
 		} else {
-			/* TODO: Aging mechanism to digest frames in sleep_q to avoid running out of xmitframe */
+			/** TODO: Aging mechanism to digest frames in
+			 *  sleep_q to avoid running out of xmitframe
+			 */
 			if (psta->sleepq_len > (NR_XMITFRAME / pstapriv->asoc_list_cnt) &&
-			    padapter->xmitpriv.free_xmitframe_cnt < (NR_XMITFRAME / pstapriv->asoc_list_cnt / 2))
+			    padapter->xmitpriv.free_xmitframe_cnt <
+			    (NR_XMITFRAME / pstapriv->asoc_list_cnt / 2))
 				wakeup_sta_to_xmit(padapter, psta);
 		}
 	}
-- 
2.25.1

