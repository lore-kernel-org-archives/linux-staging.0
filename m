Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEAB6D0D
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 08:24:53 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id l1so625962plg.12
        for <linux-staging@lists.linux.dev>; Thu, 08 Apr 2021 01:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=lqMgkJQYoqUfp1WF2Os45zue5ybF7IcJCuRBI7bg4uQ=;
        b=SZEDIXirS114Eb5GuJte8T+YJ1JDlEOJA+5LURSp3329dYgjNRwKOFe8hpzPorkHsd
         6/fBAaKNwmmiZQ5FU41qlajiInFScWcb3dRvNPSFbwFAfWNI5WIwuBAeAGjdyOyoptYp
         TgwJpZXSTRbzepwiPB3qsQ2cRhHLsX4YkKBF7aL2yvxwPYYYmcBWqd8/lodjLuwRny2g
         tJBmGxe268XgBB04t4BTB+mzBx8xSJINkYBdk5w7r6hr2SrfOOxCfdL0vMEBEFZnmmOh
         ckOV8W8Rp85n7F4fCleVO6ZnKUHzSVhJH0RFtojqfYBbqlGTm8SPYUM7cjj7LsTgiFWV
         PjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=lqMgkJQYoqUfp1WF2Os45zue5ybF7IcJCuRBI7bg4uQ=;
        b=DFJr8cNiC/bvudKxdOCZYYGAA7qdzvw65O9iyJhHutSV7knVteekmBpETBkx8p1+5S
         4idC8rqFVVYgc2mo0jJe+rg9m6b5Dv/yrDFQrqPFuLOI7bFoN+FYOgN93xLaECM1howr
         q5ebb+Fd+PCz92HesSIS1sed7oAMAeCMybE7tRNoEU3veXghir8xbyeEFilM59foG2cw
         DqLZGf/K36rMrXmyMtyy1TT1OQ7LrrkNxNF+6fKVA7J5p5EaKNjRqFvRW5nXqRzZnyY2
         S/reEqPfEklagg0nmyBPZvPF6AjGXEyb0qrWdeb6TyJysLSh+n5M5Ost3A0+8aq6R2DG
         Q/Pw==
X-Gm-Message-State: AOAM5337x3/xu77Upk++kNE7T9GNo5l953TYMYXxWzenM2H2f+WLJVHD
	w86fMDdw/9UdbroBPL/9ctA=
X-Google-Smtp-Source: ABdhPJw2QAU2YRijtKDvsrutrmbGTgXpCV+OXgSBNfEzuLUC0368gUUZciRAsm8sgJdM1C3pQkmNqA==
X-Received: by 2002:a17:902:d645:b029:e8:ec90:d097 with SMTP id y5-20020a170902d645b02900e8ec90d097mr6680046plh.47.1617870293084;
        Thu, 08 Apr 2021 01:24:53 -0700 (PDT)
Received: from kali ([152.57.40.190])
        by smtp.gmail.com with ESMTPSA id 205sm24424032pfc.201.2021.04.08.01.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 01:24:52 -0700 (PDT)
Date: Thu, 8 Apr 2021 13:54:49 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH] staging: rtl8712: added spaces around '+'
Message-ID: <YG690ZIRdCEcjoM6@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Clean up Check:spaces preferred around that '+' (ctx:VxV)
Reported by checkpatch

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/rtl8712/wlan_bssdef.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/wlan_bssdef.h b/drivers/staging/rtl8712/wlan_bssdef.h
index b54ccaacc527..ec3749813728 100644
--- a/drivers/staging/rtl8712/wlan_bssdef.h
+++ b/drivers/staging/rtl8712/wlan_bssdef.h
@@ -176,7 +176,7 @@ struct NDIS_802_11_WEP {
 #define MIC_CHECK_TIME	60000000
 
 #ifndef Ndis802_11APMode
-#define Ndis802_11APMode (Ndis802_11InfrastructureMax+1)
+#define Ndis802_11APMode (Ndis802_11InfrastructureMax + 1)
 #endif
 
 struct	wlan_network {
-- 
2.30.2

