Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60BA70
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 00:22:29 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id i12-20020a05683033ecb02903346fa0f74dso527484otu.10
        for <linux-staging@lists.linux.dev>; Tue, 20 Jul 2021 17:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=G9TO+iZ7Ir53u9Gh/j26vGhpLzZM6SVZZgf+lWvR/pE=;
        b=F7rWQqe4K8cpd1wP5r+PFJze8wRJ43Q/KfBeI8Y/63gRnVw9a/EjlaumUrfRstm0hX
         NCfReDydysSJP9cGiDHpplyXYdaOxNfmt3orCAPgayRxA452BPLQ/63i+svAJKK+Ccnh
         H1HBZj/WPbjm9k19KtlaPwE1TgQ7lrDVddZwmbJg+WUWspudLlN3D6N7SailwBEvU/Sp
         YNB4ksyMblJEKfWtfpyFQOzwlvjwdY49P7veoFOwQGtoY4P3HvVV36Nn5+MsSmvJtfjS
         n9Ape0Euw3JUfmxWRqNg3hmPil1yAp5yUo4zAIT7/CMB6mx39sq25lXt/AkTGuLYJYlw
         AVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=G9TO+iZ7Ir53u9Gh/j26vGhpLzZM6SVZZgf+lWvR/pE=;
        b=qm2Yy7Hh4sDUBgV4mlxeBhTuL8PI9Q48MFKCz5qboEqIm7SY9L/zKItCSCHzjaRS9o
         z0jpNlWq+0Z2lbNyO80Ydujk3kvRFaWwtQr+XfwOXTeNOCHVzHMbyg/JjkOGN0DEN3Vv
         NEOiYP4OBOG8xt13tMOki4lr7aMVDRE9maJimJA/KrNJo46fKf2DDJHSlfNu6qdelq7q
         t448SNKZHIbqNKt69/czpRjA+0JeAX+tce5HARlS3aFbLbtG9muvTxI3JsCaiZ0SQTLC
         YqwF1kC/M7AqnInbau2g8YIgqLHJ1DPjVfsgzTa5vz91cpHPNILuUEYPxH5c02gdicN1
         5dyQ==
X-Gm-Message-State: AOAM533gvMEIStbKxD2pqm18aZ/JOOmfpbjJDkP8y3UOsy2OtsQtMx6B
	lQhHWZJicGRApYJ2L4Sh+jKU5tTGkfo=
X-Google-Smtp-Source: ABdhPJwRIpApJ1EXCXjB+f0uM611tDA5JGFduBOALAFTgFcvlM4BoGq5VZJSfHp5gEvBeFaeqjG6IA==
X-Received: by 2002:a05:6830:1c65:: with SMTP id s5mr18764814otg.256.1626826948826;
        Tue, 20 Jul 2021 17:22:28 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-31-246-181.kc.res.rr.com. [24.31.246.181])
        by smtp.gmail.com with ESMTPSA id x22sm662479oie.28.2021.07.20.17.22.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jul 2021 17:22:28 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Subject: Re: [PATCH resend] staging: rtl8188eu: move all source files from
 core subdirectory
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: Phillip Potter <phil@philpotter.co.uk>, gregkh@linuxfoundation.org,
 dan.carpenter@oracle.com, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20210719224601.255364-1-phil@philpotter.co.uk>
 <7bc43fb0-2dab-190b-c480-9e77cff863d4@lwfinger.net>
 <20210720090035.GB1406@agape.jhs>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <08a8b372-8ec2-afcc-cc54-305d1dd74a59@lwfinger.net>
Date: Tue, 20 Jul 2021 19:22:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210720090035.GB1406@agape.jhs>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/20/21 4:00 AM, Fabio Aiuto wrote:
> maybe the information we will need one day is:
> 
> will the core/-os_dep/-hal/-include/-directory-structure be
> welcomed in mainline wireless subsystem, when an rtl* driver
> will be perfectly tuned?
> 
> At the moment I can't see such a directory organization
> in any of the realtek wireless driver.
> 
> Sure there's time for that;),

The question is how much lipstick do you want to put on that pig? The current 
version does not use cfg80211, and it does not work with NetworkManager or a 
modern hostapd to create an AP.

If you want to get the rtl8188eu driver in shape to be added to the regular 
drivers section, then I suggest you start with the v5.2.2.4 branch of 
https://github.com/lwfinger/rtl8188eu.git. Many users of the RTL8188EU chip use 
that driver. At least that version fixes the two problems listed above. If you 
want to flatten the directory structure, you can do it there and offline.

I want to caution you that following this path will take a lot of time, but once 
you get it into kernel shape, it will at least be useful. I have never had the 
time, nor the ambition to undertake this effort.

Larry

