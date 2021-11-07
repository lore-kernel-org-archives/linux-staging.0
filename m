Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692AA2C83
	for <linux-staging@lists.linux.dev>; Sun,  7 Nov 2021 14:30:36 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id w1so52242563edd.10
        for <linux-staging@lists.linux.dev>; Sun, 07 Nov 2021 06:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VkZdp1HkaN3DnI5e1g9E/OFtiofaFNZ+ta8eLRiYVVI=;
        b=fvhz2TTGFAIoGB5s9RnPhgBlyRYo5MFtXomKs48FXDRMgCJq3/OozSumN8x71msSMB
         zfz5M/QiKWSN6gU368BoOCA/YlZLnxcS/j+4ZgxCXr7GAWvTymFPg2XYfhY0tmrZ+BHw
         ieYkFfAX38VLzufOO0rTTGMqjE9uz6QJVcnO9JrqN2iVrkffPskOSLJqsFAh0+7rj0xm
         A0YQiORaTQloUWDLR+kANXDPB32DwpvuBKDA5WSXK+0yCHd/a+JRxfdl+RxBm2EwRCaA
         1VFGA3W/0AF1Icgs1o7T5QvQMcjHz8Wyua/FNlXDW8C0SJQDF3k/duP88ztbMZmyT2IR
         IOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VkZdp1HkaN3DnI5e1g9E/OFtiofaFNZ+ta8eLRiYVVI=;
        b=lYMMQAzTR8jXx+v08fuOB/hm2Gpc0cgq6GR/5EODenWh4U3EcGxQqDf5a1OgXRlwBo
         AmedSKBwuxDA1C/EEun/C6G4zoEaJzWg9Db3zjtVOZNCP2JSrrwxEIh+6Lf4G7MKiqjd
         w+G9R2IsCY87aFjkD/rpFZISDdOxGXs2yus/mljve7HyCevRba4feWr1BMeulYZXDylU
         0D8gQNAC9WSuzKNAsQRuf34eRwZDqpQ9qO25GwQlC6lmdryBDhlHYYTlxY8ubHLiT1l7
         tGIcJ8IIDwGj57TmOoiZFpVw0j/hTtEFNb92sdgCRW62sxd4meu4PXGJ/uW0l+18sR69
         QDpA==
X-Gm-Message-State: AOAM531EEwug/EMXGW5C99BJuMctOaQXVDGnCDRB5YdJbsc7n93tmMmD
	jxmgtKgi4jq9lYrnRyNb51ZzCQvC+DQ=
X-Google-Smtp-Source: ABdhPJyeP5nq6O6JqBDX0APvDtKq/YNSc4d+jjr2BnrzBnb5Hc61A5o3DGUdMYA4GZ4/uqwrJqnXuA==
X-Received: by 2002:a17:907:7f8b:: with SMTP id qk11mr89725169ejc.313.1636295434776;
        Sun, 07 Nov 2021 06:30:34 -0800 (PST)
Received: from localhost.localdomain (host-79-56-54-101.retail.telecomitalia.it. [79.56.54.101])
        by smtp.gmail.com with ESMTPSA id sg17sm6987699ejc.72.2021.11.07.06.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 06:30:34 -0800 (PST)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: r8188eu: Use kzalloc() with GFP_ATOMIC in atomic context
Date: Sun, 07 Nov 2021 15:30:33 +0100
Message-ID: <1887847.D1JkeFG8k8@localhost.localdomain>
In-Reply-To: <YYff78mUK+9F9pEN@kroah.com>
References: <20211101191847.6749-1-fmdefrancesco@gmail.com> <2284999.BhpMBdGVLH@localhost.localdomain> <YYff78mUK+9F9pEN@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday, November 7, 2021 3:17:19 PM CET Greg Kroah-Hartman wrote:

> No, your change will go to the staging-linus branch, as it needs to go
> into 5.16-final and get sent to Linus much sooner than 5.17-rc1, which
> is where things are being queued up in the staging-testing branch at the
> moment.

Oh, I didn't even remotely guess that this kinds of patches usually go to the 
staging-linus branch so they get sent to Linus much sooner.

Thank you so much for your patience and for taking the time to explain the 
workflow to me.

Fabio

> 
> hope this helps,
> 
> greg k-h
> 




