Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D80D72
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 02:38:51 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id s20so19989113plr.13
        for <linux-staging@lists.linux.dev>; Thu, 29 Apr 2021 19:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-disposition:content-transfer-encoding;
        bh=jaCub1Sk5luNFcSj2KyJUdoWo/o9f4mzXOf2bkFAbRc=;
        b=gCndhTw3ouP0rMi0uKkO4yYmc7jRf0minwRX/Kisp3zUqWh+ygE+h+/Me3vzKPW66S
         nO3Noa7whRSWeksIenMTgmXEprywhUOgoI7ThvhzlAAp5eMieV9d8pBAEIUANrSYLOiN
         lLb9anH74xTH5vPl/wiZIEtVCCJBTHnSrAKAFtT8KaO4jhs5GhWSXOMXnpR34jHTJ0JQ
         kV8/2E1wanSSCO7GynRJ9qM612MP4GV5g6WkEw5jv8+4d9uqlzAX2HHHAuej2E7wZE+S
         +vx9UHNFM0+exkUHL0O9GBKUaYps8YtKhvBsS+DVaBSdTuH/pFyomWBmfCpBD4NdzoT2
         PzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-disposition
         :content-transfer-encoding;
        bh=jaCub1Sk5luNFcSj2KyJUdoWo/o9f4mzXOf2bkFAbRc=;
        b=ulCzFqk8SOtDjQWADXOIyVYKnj7Bn02vpQSEtAddvGW871MFQSxEwezvGSm4NZluB3
         hVKRHs9VvM8G9tz6T8IvNCgs9vc+nZgL2LZ1jvT6MaGx5xsI3NomjV4iZM7Qin1xL5ZL
         TAluXnP6lItUuuvrXcXE7EqH1kJbArZ1VAuHT7wWhek1PPjClpheeVsRD4sy0HGXA3uV
         uETjUne7fshudhSpnHxzhsz9BPe3dyKwGcCyapjJM9qAQvSMzvX4J9bolxx7eYzZvA/5
         PNRg22nqdScb2zpQ7/wRQK8T3WEkAYXI1b5b1qcVwRn8ghULAwJ77dPOpMGah3VxCPUP
         Qiuw==
X-Gm-Message-State: AOAM533xxKF61D7KBeYmAerPNLGf941O7RyKQMkBwfM8NsdfttkYvf+o
	cCFIdF/23VS4cs6P+m1rXgI=
X-Google-Smtp-Source: ABdhPJxoY/Hw8IXQtiW/BgUbYJZMs3c7bERLbztAkvCoMex1EAzOXh7z4+LBt9CcfYAY9pz/zdslhg==
X-Received: by 2002:a17:90a:a389:: with SMTP id x9mr12546207pjp.232.1619750330653;
        Thu, 29 Apr 2021 19:38:50 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
        by smtp.gmail.com with ESMTPSA id in1sm8765736pjb.23.2021.04.29.19.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 19:38:49 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: David Miller <davem@davemloft.net>
Cc: andrew@lunn.ch,
	f.fainelli@gmail.com,
	hkallweit1@gmail.com,
	kuba@kernel.org,
	Landen.Chao@mediatek.com,
	matthias.bgg@gmail.com,
	linux@armlinux.org.uk,
	sean.wang@mediatek.com,
	vivien.didelot@gmail.com,
	olteanv@gmail.com,
	robh+dt@kernel.org,
	linus.walleij@linaro.org,
	gregkh@linuxfoundation.org,
	sergio.paracuellos@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	weijie.gao@mediatek.com,
	gch981213@gmail.com,
	opensource@vdorst.com,
	frank-w@public-files.de,
	tglx@linutronix.de,
	maz@kernel.org
Subject: Re: [PATCH net-next 0/4] MT7530 interrupt support
Date: Fri, 30 Apr 2021 10:38:39 +0800
Message-Id: <20210430023839.246447-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429.170815.956010543291313915.davem@davemloft.net>
References: <20210429062130.29403-1-dqfext@gmail.com> <20210429.170815.956010543291313915.davem@davemloft.net>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Apr 29, 2021 at 05:08:15PM -0700, David Miller wrote:
> 
> Please fix this:
> 
> error: the following would cause module name conflict:
>   drivers/net/phy/mediatek.ko
>   drivers/usb/musb/mediatek.ko

So I still have to rename the PHY driver..
Andrew, what is your suggestion? Is mediatek_phy.c okay?

> 
> 
> Thanks.
