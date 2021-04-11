Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F8D72
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 11:35:14 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id o123so7314949pfb.4
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 04:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0tmRORdRg1bQn0Wbj1SOLr37bS4BZCkXUnlrXGSpfdA=;
        b=It9maA02mKRyRB3V6Xt5Cx7F3mTkEAHeFgbIzbGtukC1k2tqI3eeA46zLvAvo+zGvz
         BP6HG7vvnByFBQxEnndmLwlQGZ2RoejCotoKmUN1cxwd7r7HzvhyaZwhkH0dDrnIgSM4
         dT1t66yBn+V77DFJuwI0itSIMyliR4OcO1DEi+AElXZ/tz/Boo+bITLwdrIAMDF+wMUV
         7kFNUKROT3jv66dNwAfNVB1rR1BK2Ad9iaXPmOAV0BnY4CFYONl569jqe9layby2bvF3
         4W98wl++KN1Bk+J2CZ5Vfe4ECK1egcGOJcdFiaQJdlaTSY5HkOLiml+RBnrYMknwOY11
         kkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0tmRORdRg1bQn0Wbj1SOLr37bS4BZCkXUnlrXGSpfdA=;
        b=oxe+4KOKbHmIRTmQ0iroGWa0sHHfsp4L60TIGk8GF74cPMAqf4/Xo5YcH2scuENziA
         RLUVMxwfFJKOfiAYHHsISXrOSakXn+y72TV0HE5T2dRiGt68ljf++sCFfwPUyqddoiiy
         tb7gQEOsQ4LH4tynmqFkYKjA1oLJNveeajUSEpH6IJTKpFYpPrmab9zoqPW14rr2zxTK
         MJjPmyyzAfTQiMIwr26frQU1K41btFaob8uU9Iq4WbEIEeV8LeI+RwkzCuz3gw8UnVLh
         +aPZuoeHE0vliO2dNMkTgu5coOUoCuUFJ8Db71gJS7TbmrnMVigwA1lo7+O9qtQFBgqt
         IOBg==
X-Gm-Message-State: AOAM5304mxr4l54pw0FPV+k7uQ7/09wgVs0SCU9X+kWRWZQD7MdwTpAD
	pgO+ohYtd0rRWYqCVGsl0T8=
X-Google-Smtp-Source: ABdhPJzCvmIEkORfDhkjcip6rh8A4fDhbaCm2EkDgNMbDevTD0kPaHzdHqBZNBADarZrgAFL5u87Cg==
X-Received: by 2002:a63:c157:: with SMTP id p23mr15357130pgi.162.1618140914445;
        Sun, 11 Apr 2021 04:35:14 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id mu6sm7450956pjb.35.2021.04.11.04.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 04:35:14 -0700 (PDT)
Date: Sun, 11 Apr 2021 17:05:05 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH v4 1/3] staging: rtl8192e: remove parentheses around boolean
 experssion
Message-ID: <596aa7e6d4e8ce80eaa98519001e17cf9d370f45.1618139271.git.mitaliborkar810@gmail.com>
References: <cover.1618139271.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618139271.git.mitaliborkar810@gmail.com>

Removed unnecessary parentheses around '!xyz' boolean expression as '!'
has higher precedance than '||'

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---

Changes from v3:- Modified log message. 
Changes from v2:- Modified subject description.
Changes from v1:- Removed unnecessary parentheses around boolean expression.
Changes has been made in v2.

 drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index b1fa8e9a4f28..431202927036 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -276,7 +276,7 @@ void HTConstructCapabilityElement(struct rtllib_device *ieee, u8 *posHTCap,
 	struct rt_hi_throughput *pHT = ieee->pHTInfo;
 	struct ht_capab_ele *pCapELE = NULL;
 
-	if ((!posHTCap) || (!pHT)) {
+	if (!posHTCap || !pHT) {
 		netdev_warn(ieee->dev,
 			    "%s(): posHTCap and pHTInfo are null\n", __func__);
 		return;
-- 
2.30.2

