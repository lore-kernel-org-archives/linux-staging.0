Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B66370
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 19:46:00 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id c17so7785904pfn.6
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 12:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=jyH0A6ClPB0zsoVJunsM9FMNKSR906bep9nUXtpL+H0=;
        b=mMx3o2drvRIPugGDVwVww2EsbkyRserUm8cjFGBZmWUA9HIyBRymOz/5tRprlQ2yMx
         mDdA7cqDiXNDOpr/8t2X+f1X3gt8FOXLvFp5keHwPL34xYyFGiogtMWTS1CIBwqZp0EI
         ugVGZFCBGJZ4WUm1MffjpEFYCYMX+jTNoF6mTeP7iGL7XhFWyUSJMR90UJebZ7+jZJRz
         jFIrFTRU3+q/Ia7O8UqIPGEn+VcekC8rv2kDbwpYxF8MeHErJH8JH+9JEKu5PEIr6HAl
         kX8PhRhCkKJxtcrKwJZJ709ulDG1lcibHblZvx9YNmMVpchNXlLt5Do7x71up0JYhmeA
         dNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=jyH0A6ClPB0zsoVJunsM9FMNKSR906bep9nUXtpL+H0=;
        b=sLcz3WmUBY+NubnDlbLlSdD2/KAr32U8Z4KhZ+nSBhm+jVL3GJnWx1bQjSIebRKLY4
         zSTVhBbH/pNfRfSjNsq/OwT71ClKJzgp7pvyJMA5nhxT5xcs5Wj7x7u/vN9SPW8cwjPk
         d/8I8JmDIp4qeeyXvQlX3alX+3stEBFbr1730WgrepBFzn1aKalrnF04PVUEpStY7qJj
         XjBGax3IsMWcz5jZBcmJmJkoePwF8YffOTip6vrFqwa0E6W0NHdcdnSD/iBjxg5WGFVQ
         P+PyGK9S6CXoPp7Ri1SJZtbCaUtCEErHMYf0Qk5lyZBCtJw+CljtTib/juBnwSpT7bsi
         rMbw==
X-Gm-Message-State: AOAM5324s2finI5JVbOmkk5FKGSEcKe+YUKJJOUGKetazXtWFxaNpAhA
	H+CFkMEFgUNhjikvNPajn1I=
X-Google-Smtp-Source: ABdhPJx/XYEjRr2opCzK8ijbVnePl0KVYe/0TWdDHP3rdLrw/WT7dOAkZnaU5oXcQYMd0w501wnHSA==
X-Received: by 2002:a63:175c:: with SMTP id 28mr22566637pgx.376.1618170359606;
        Sun, 11 Apr 2021 12:45:59 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id fs3sm8431374pjb.30.2021.04.11.12.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 12:45:59 -0700 (PDT)
Date: Mon, 12 Apr 2021 01:15:52 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: nsaenzjulienne@suse.de, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH 0/2] remove whitespace and rectify spelling error
Message-ID: <cover.1618169920.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch fixes whitespace and spelling mistake issue.

Mitali Borkar (2):
  staging: vc04_services: remove trailing whitespace
  staging: vc04_services: rectify spelling mistake

 drivers/staging/vc04_services/interface/TODO | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.30.2

