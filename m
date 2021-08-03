Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8363970
	for <linux-staging@lists.linux.dev>; Tue,  3 Aug 2021 07:21:34 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id h9so19438945ejs.4
        for <linux-staging@lists.linux.dev>; Tue, 03 Aug 2021 00:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=zk0yCGi4r/e9LLvJfBDttH3vA3pT29iC5wtMDHsFnhI=;
        b=Gu/y1gR/N5bVT2sjUnGBnBISedvSaO8jO1zbORVDt+181l16GoiDJRNb3almtafKxf
         prS7kDlPqtoTqmapvgc/t6MEl3BrgTJz1MYLX2u5R2KInDMX6x9mFVXI0rzHv+ijgYER
         RKVvaTla/ARDSgLG9t1ggTNoXCJrkP9hCPmvZhD/fGc4Qj6WmGOqmD+7Bh3qpJL4ThFn
         hxfYHf6xtAOXTcytYClzpuXskwYmLWzeWUImmVJ+tNJvEa6N6bqFm2DSeHWFoU2SobWu
         f1PLD0sYwGjfFVd9I78iZOp0010oD4g7gVgLmtN1kNISiGZrSnZTuo9B5YxtYa1lDdVA
         q9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=zk0yCGi4r/e9LLvJfBDttH3vA3pT29iC5wtMDHsFnhI=;
        b=mbU/VaXVG0TWRYaNM7grg6Ak4M4ZkFKOlx1u7HFHdFsogL8/RftIIXpc/yOpKBLdNG
         QTG/Vx2QWRh5OzHsOtKuo98gAtqnj8ZVRiIRSTw6R9zIpRsOETaXy/REbD1oZUO20IIa
         M2NA0ZpameHhafus/cggYwu4F0z3DrF1+C+9gG9rZxQghki5QQ08I+SVYsBHMx61M3/s
         v29Mbr8T/MAtZtn1DcbV/eXAD+yGhEYXtCphv5sQ2KguW+deXTKT4NnnFz+f4bpVZD54
         WjrMkXPYTQUzfWW/geLjSeJuPOcxJWFLNOe+UOMd1jcRZJw8yBMLII4Mue4nJd1XTX5k
         Fhlg==
X-Gm-Message-State: AOAM5326q+R46fm0vnA5NMCEW9isdDCUUIyoiR290pIqfwkf9tuGWhrd
	saZLR+jHpK2edmEIULuv3GU=
X-Google-Smtp-Source: ABdhPJyJp6pv1N3arKVhJ2ltXsGX2o4Aoxf7YbAcMHytQpVOJpFMwTDLyoNtSFlWMI/3bfdtTxUwww==
X-Received: by 2002:a17:906:b794:: with SMTP id dt20mr18676491ejb.363.1627975292930;
        Tue, 03 Aug 2021 00:21:32 -0700 (PDT)
Received: from agape.jhs ([5.171.72.207])
        by smtp.gmail.com with ESMTPSA id mc11sm5280061ejb.110.2021.08.03.00.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 00:21:32 -0700 (PDT)
Date: Tue, 3 Aug 2021 09:21:30 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com, Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: commit c7e88ecbe328 ("staging: r8188eu: remove rtw_buf_free()
 function")
Message-ID: <20210803072129.GA1422@agape.jhs>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Dear Greg,

I followed the discussion about the bug that was
introduced by commit c7e88ecbe328. But I can't
understand why this patch introduced such a bug.
In the changelog of the revert patch you wrote
that you forgot how pointers work (:-D), but
I think I forgot either (if ever known :P).

Do you have any idea of what happened? This
topic could give us all deeper understanding
of kernel memory management.

Thank you in advance,

fabio
