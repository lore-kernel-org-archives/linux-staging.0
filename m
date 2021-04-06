Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DB6259E
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 02:32:51 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so8833396pjh.1
        for <linux-staging@lists.linux.dev>; Mon, 05 Apr 2021 19:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=kc3RPHxu+J++goCeHYiszuO53o7w5S9ayyCjfILd0lM=;
        b=JRYHITpo6w4w07x9yRv9Y9YpxqOUkRdrcY7yhtNdP5rDzdROEP2WMn26aq0pTDHK1T
         ybmQVLS7toVRvKURVxYTDZc0ApGeOYbGJVoeq1vcSbp9gEffzjUTWmlDLjqTLv+SraPk
         GmZetivej+25TtENIpyBrjUBHl/Siq/9Bv68wmhqD9PKiNMmmi0GD6x3Fb1kB/wvJYGa
         wbuEn1uafdMLoIT29uETd8/6IvNGUig3tRIMgqb1up2jvShYxR8kZaOiZP4TdXacYVpL
         TCCcrjuanWl/IFfwJMwuzchhVBu3eZWAWygQ8oUy7FMLz/g9WhdUyF02omrB+T/byJGv
         aIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=kc3RPHxu+J++goCeHYiszuO53o7w5S9ayyCjfILd0lM=;
        b=fq5Wd9xKyIirpMZtULCZ8a1CdFm9vbTlfHjGwUNWs2Ox2A+NGmRSa6IdbsU+45EA3g
         5dvjyBiC3mk0MqmVlJ6OVIECOGAazWNxC/awQzikAjamAQcncNPdIkuNqxNCVBLHzvI5
         GXLWOkUMPMLE/HrixIY30fZi+kgqnWdcG1/FXvVSpXvHcuKfiSDJ0bUTPaE34hI09xC0
         WeGjnN+4lJL6Q2m4dNITRYv37PUOf0A76TBSsahssKeUvfeJVMQCE6jC94IRG1pqWntv
         DzWBSW7SyfYZ6L5md/wuqt4SrxMn7GFGpgvkZFZLyl0805w3lbzH9OI9VCrPceHCHOzt
         QGoQ==
X-Gm-Message-State: AOAM5338M9b/u63YHU3Dp5dIkws9+tws1QYPnicMWxNp83b6l0WOL4aI
	kUNWB6qJPTlQpawIvIn9IFgpmZM9DmIK8g==
X-Google-Smtp-Source: ABdhPJwzKtZy9r41zSCW0z4OszFZhjdGMtgly1rMyHybMJOS63uziIFDP6xwB2vi+QW+xAum79bpaQ==
X-Received: by 2002:a17:90a:4a8e:: with SMTP id f14mr2128684pjh.84.1617676371091;
        Mon, 05 Apr 2021 19:32:51 -0700 (PDT)
Received: from djbComp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id e7sm281196pfv.107.2021.04.05.19.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 19:32:50 -0700 (PDT)
From: Deborah Brouwer <deborahbrouwer3563@gmail.com>
To: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com,
	Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH 4/4] staging: rtl8712: add space before binary operator
Date: Mon,  5 Apr 2021 19:32:20 -0700
Message-Id: <6db3ca92022376d162289174e201c79017b366db.1617674639.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617674639.git.deborahbrouwer3563@gmail.com>
References: <cover.1617674639.git.deborahbrouwer3563@gmail.com>
In-Reply-To: <cover.1617674639.git.deborahbrouwer3563@gmail.com>
References: <cover.1617674639.git.deborahbrouwer3563@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Add a space before the binary operator "|" to comply with kernel coding
style.  Identified by checkpatch.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 drivers/staging/rtl8712/rtl8712_xmit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/rtl8712_xmit.c b/drivers/staging/rtl8712/rtl8712_xmit.c
index ad9ea05504db..116cb812dcb9 100644
--- a/drivers/staging/rtl8712/rtl8712_xmit.c
+++ b/drivers/staging/rtl8712/rtl8712_xmit.c
@@ -368,7 +368,7 @@ void r8712_dump_aggr_xframe(struct xmit_buf *pxmitbuf,
 							0xffff0000));
 
 	/* urb length in cmd_dw1 */
-	pcmd_hdr->cmd_dw1 = cpu_to_le32((pxmitbuf->aggr_nr & 0xff)|
+	pcmd_hdr->cmd_dw1 = cpu_to_le32((pxmitbuf->aggr_nr & 0xff) |
 					((total_length + TXDESC_SIZE) << 16));
 	pxmitframe->last[0] = 1;
 	pxmitframe->bpending[0] = false;
-- 
2.17.1

