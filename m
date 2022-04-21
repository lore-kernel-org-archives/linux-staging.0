Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D5823A1;
	Thu, 21 Apr 2022 19:20:43 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id hf18so4038263qtb.0;
        Thu, 21 Apr 2022 12:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jWtgrgCunJ7y2eDAedOrW5DZBPj0gqKyi2a7G2/e/4U=;
        b=kAW26HAITAbFAGVv0mM9r7y00YX31OV1dRygPiaqLdWdJzBeBEKEZNZHIxbLx9WOkW
         btvNY2sO6K/ieesQJ98dqudLJhtWtUUNyNSIRHfCnqZ5frxqHgAQz6NClgdRYAQRgZ6B
         laNadyJFcCsw67vkgQzjXdGJgo1CvPOPkD+YT4g6LeIzMMhM4uAe6SKlafNpsqb70fST
         ReP57qGKSUdcFmfRREz0jbqjLbgWoNciyjgTa1lVEnZXZHhwKHj8Hd/8NSubRJDOpl+R
         h4D+B5Fu/rXzQEpingwJDM0VKq51WLV7pRACX42n6WGxnAr5vxzv9qVoHAgkkVUpauiv
         eUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jWtgrgCunJ7y2eDAedOrW5DZBPj0gqKyi2a7G2/e/4U=;
        b=wRNXq+pWqHD9CXoizDc9kwp0bbg/GbK1Tg2Ms398DRQMcMGfvk7CmxbBlUSk+Qg8hQ
         vNvOFuqIPy/EXLCS4JOBh7Hiq5eOPcBVDrG4ncL9iYO0ZQNVGwjEO2+J2bmoD+/5zd14
         nrBbKJNLcO9evjM5WnFsYMX996nzBmxUSOjNnxK9tjtW3hyoXhlAaCHxWou5aEui6I6b
         Vg2fAwU8pZhUIChqjcBpKxN7c3jlKTkJRRRHTc5kU31LOWRb1RRzYi7YEP9N1MmMo0uV
         K2z1r2k2roJennL8FfMp3ZEQtVYdLUMpcCm5+B9CY5G3J3OBWk+fFKXqT9n7VNATHL5V
         fWCA==
X-Gm-Message-State: AOAM530nQ85RsPmEFp+FYE7vsCY0DTwE6f1UUkQEuGZzizzwjUQAeWS9
	Be3rPluUhqxPhm7yt/cMHdR1T2gqGVhhAaBO
X-Google-Smtp-Source: ABdhPJz0Sf/4uOw6SGvqQ+a5x/bu+v79Td0Vm9arvLkFPYfsQM5zt7PHM/U9bdPm1KqkX8vXTmshvQ==
X-Received: by 2002:ac8:5a09:0:b0:2f1:ff1d:39df with SMTP id n9-20020ac85a09000000b002f1ff1d39dfmr731992qta.453.1650568842469;
        Thu, 21 Apr 2022 12:20:42 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.wework.com ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id l9-20020a05622a174900b002f34421b01csm2567736qtk.23.2022.04.21.12.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 12:20:41 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	jhpark1013@gmail.com,
	Alison Schofield <alison.schofield@intel.com>
Subject: [PATCH v4 3/7] staging: r8188eu: remove 'added by' author comments
Date: Thu, 21 Apr 2022 15:20:28 -0400
Message-Id: <dd22bbe6b018aadec620d1ef8215e19852099f7c.1650568579.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650568579.git.jhpark1013@gmail.com>
References: <cover.1650568579.git.jhpark1013@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Author comments "Added by Albert" and "Added by Annie" are sprinkled
through the file. These comments are not useful and can be removed.

Suggested-by: Alison Schofield <alison.schofield@intel.com>
Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 2cfd8e8d74a4..5adef9b9108d 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -909,7 +909,6 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 			memset((u8 *)&psta->dot11txpn, 0, sizeof(union pn48));
 			memset((u8 *)&psta->dot11rxpn, 0, sizeof(union pn48));
 		}
-		/*	Commented by Albert 2012/07/21 */
 		/*	When doing the WPS, the wps_ie_len won't equal to 0 */
 		/*	And the Wi-Fi driver shouldn't allow the data packet to be tramsmitted. */
 		if (padapter->securitypriv.wps_ie_len != 0) {
@@ -1628,9 +1627,6 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 	return ielength;
 }
 
-/*  */
-/*  Ported from 8185: IsInPreAuthKeyList(). (Renamed from SecIsInPreAuthKeyList(), 2006-10-13.) */
-/*  Added by Annie, 2006-05-07. */
 /*  */
 /*  Search by BSSID, */
 /*  Return Value: */
-- 
2.25.1

