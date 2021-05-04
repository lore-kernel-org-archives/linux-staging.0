Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B797471
	for <linux-staging@lists.linux.dev>; Tue,  4 May 2021 13:14:42 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id n16so4764197plf.7
        for <linux-staging@lists.linux.dev>; Tue, 04 May 2021 06:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=hYscccQtInzVIIE3wPGEE1nZ7KxAq9jPIPkgq2j/trs=;
        b=HRX5zq7Gq2iBjWFjbUWqXm7P1956Vm4gvxsYgz0jqKIV6S81bFf0aade4+heGddAZr
         ijn5z30PjLa/qjLaG1Kp/ki9BzBeZUMihVtkvR1QJ/ln+nmb0ub1nPrFLTJn77gs+U8n
         r1IhnsHS3vymuF11R+qRy9oRuFndd8yCA1AIRT/eDly7ZR9EwW8TR80f/pKJKNaMU/eN
         R+OPXhNWJMsVQl4vNhGzMy2vUYy62SnO7lZPTB4+fCpYdDxwEA/QXXyQMehlsL+ZdnNp
         kzK3f2JT+fJSFZlclfvsYMhnemdHta+KhnGy71+DzsnCntHOnS8gwNc3BYphhNmLrXgg
         X8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=hYscccQtInzVIIE3wPGEE1nZ7KxAq9jPIPkgq2j/trs=;
        b=JCpyF/QsUOv6CSBIrqwcITc/xSpbbpNz5IBa2UND9Dv14OJELh+hpHrrki3HwwcLiW
         YMul8qEPr1YmmPCmSgTZrQOUge0lFSZmyT1yFkm5wkkNEOrGsz68FQBufvRKqxaJIk8Z
         a7F1xrYbn4jjPSzBQyfODm3XR9ZKs8EpyEN4PIesfMb6yTzoZCKvuIV5xY7hPwcmbaRD
         ca3E7+BpTJPJUodujM2WBt+DmVhZQFzcU3BRu2yq+3TbQgR8GrxLdHiQXuAji4fm+pRY
         UxSibZggFvpMXoRUDLSHYQr2ycEf82dhm9qQJmnC546Qhowxo5jKPSXtN7D6NVQC/zOl
         Pi6A==
X-Gm-Message-State: AOAM531W9doCVuWbvUh/UUTye+fpdEOzYHSF15890m3rhoKZoesthVV2
	0ghdY4267g5tN6YQYRRmX0I=
X-Google-Smtp-Source: ABdhPJz5LBUBq53amifXrFCb/w4Kxz8itORUiH/PcMkI7+lGItgFFfpX15gQ7YR8uATT6IiujZsYmA==
X-Received: by 2002:a17:902:b095:b029:ed:46af:e33f with SMTP id p21-20020a170902b095b02900ed46afe33fmr25667553plr.23.1620134082230;
        Tue, 04 May 2021 06:14:42 -0700 (PDT)
Received: from localhost ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id ls6sm3418572pjb.57.2021.05.04.06.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 06:14:41 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Tue, 4 May 2021 21:14:21 +0800
To: Benjamin Poirier <benjamin.poirier@gmail.com>
Cc: linux-staging@lists.linux.dev, netdev@vger.kernel.org
Subject: About improving the qlge Ethernet driver by following
 drivers/staging/qlge/TODO
Message-ID: <20210504131421.mijffwcruql2fupn@Rk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

Hi Benjamin,

As you have known, I'm working on improving drivers/staging/qlge. I'm
not sure if I correctly understand some TODO items. Since you wrote 
the TODO list, could you explain some of the items or comment on the
corresponding fix for me?

> * while in that area, using two 8k buffers to store one 9k frame is a poor
>   choice of buffer size.

Currently, LARGE_BUFFER_MAX_SIZE is defined as 8192. How about we simply
changing LARGE_BUFFER_MAX_SIZE to 4096? This is what 
drivers/net/ethernet/intel/e1000 does for jumbo frame right now.


> * in the "chain of large buffers" case, the driver uses an skb allocated with
>   head room but only puts data in the frags.

Do you suggest implementing the copybreak feature which exists for e1000 for 
this driver, i.e., allocing a sk_buff and coping the header buffer into it?


> * fix weird line wrapping (all over, ex. the ql_set_routing_reg() calls in
>   qlge_set_multicast_list()).

This issue of weird line wrapping is supposed to be all over. But I can
only find the ql_set_routing_reg() calls in qlge_set_multicast_list have
this problem,

			if (qlge_set_routing_reg
			    (qdev, RT_IDX_PROMISCUOUS_SLOT, RT_IDX_VALID, 1)) {

I can't find other places where functions calls put square and arguments
in the new line. Could you give more hints?

Thanks!

-- 
Best regards,
Coiby
