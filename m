Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2533FC8
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 16:46:54 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id 6so18584348oiy.8
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 09:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=obSBg7yoA8+wBn+9K/jBy5HRK2evrx5Rl7Npq0wHYHg=;
        b=SZjbm7c3OdFuckYQ903VM07ZGtiPuY1r8bAJ+GiKVRlbJyxq/l1nqB3LXLc95HCqOR
         qFGU2jZx//GGmJ17XWYCBb8pEThdNc+e2mhGvo3FVo4NQ9HGl2MOYho8psPZ0Z7NLyc4
         +3TZN2W0u2Wn6kSutXwRWjiwQVPwNmk9olWvweTCeSOh3vRZx8HayQgDWclctfLkoeHL
         zEsAfv58yu/5kTY8lZtc9La/QhLpJQh1qILarqfuQdCotwfnro/C/8yKiHDtY8dhGlaj
         tnNrWDNo/xXlh6EawZ6DaOIp+fnox0v/Lrb68Zid3MZX0IXbJKknYBt/srLVQrxxNnmD
         oLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=obSBg7yoA8+wBn+9K/jBy5HRK2evrx5Rl7Npq0wHYHg=;
        b=ShRguNl9QF3uL/gRUOINyK1HDnty1KbfEtL9IrPbdzbCV8NgXWEs5oTDjVqBQMS5cI
         rwd0XA7/DFvwZU5bLosG8HLemkhS4BCcJhF0gZVcLuJa/4mxqMhaFLGwLnkMpiXz/5Vn
         7nBHGI0rOwQDzE4TQz/6sE7VV8GxfnlxeRCGwQLtD1fq382w+p1Xuy8hXAjJ4ni4ogVD
         p+8OoZkbcasTYfgg8mBrktsWp2OlfAIQhmM3sJH7uSGoSmSVloemuQpLI6qfdCkpQlbP
         5l8DBaJz2cN2nVEY4iHcJK8Z88p3qcgj0P6p2MBhK0oMAYVYBcZY+r8xmEdwyIQmoAgr
         zAng==
X-Gm-Message-State: AOAM530lBSL2XgrDSRc+T8FkV+GcoWG3RFxzS+JJh/tkPgbtArSoV8KQ
	25B21069hrt4oT5iEyelGWQ=
X-Google-Smtp-Source: ABdhPJzTgiK5k3wxTcFSH+8ValyCDQhB2y+AWRWhvCRi0+VDHB1aFFghNw2fPZNAL/ckm4vd9aNheg==
X-Received: by 2002:a54:4e84:: with SMTP id c4mr13665751oiy.106.1631983613291;
        Sat, 18 Sep 2021 09:46:53 -0700 (PDT)
Received: from ?IPV6:2603:8090:2005:39b3::1007? (2603-8090-2005-39b3-0000-0000-0000-1007.res6.spectrum.com. [2603:8090:2005:39b3::1007])
        by smtp.gmail.com with ESMTPSA id ay42sm2216153oib.22.2021.09.18.09.46.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Sep 2021 09:46:52 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <89d9424a-d792-633a-d8e8-cebe7c3a2e20@lwfinger.net>
Date: Sat, 18 Sep 2021 11:46:50 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: staging: r8188eu: Can odm_DynamicTxPowerNIC() be removed?
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>,
 Phillip Potter <phil@philpotter.co.uk>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <7f1c135a-d85d-d271-f315-d665a5fe1472@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <7f1c135a-d85d-d271-f315-d665a5fe1472@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/18/21 08:31, Michael Straube wrote:
> Hi Larry, Phillip and all.
> 
> While removing code that checks for the chip type I stumbled upon this:
> 
> 
> void odm_DynamicTxPowerNIC(struct odm_dm_struct *pDM_Odm)
> {
>      if (!(pDM_Odm->SupportAbility & ODM_BB_DYNAMIC_TXPWR))
>          return;
> 
>      if (pDM_Odm->SupportICType == ODM_RTL8188E) {
>          /*  ??? */
>          /*  This part need to be redefined. */
>      }
> }
> 
> 
> (pDM_Odm->SupportICType == ODM_RTL8188E) is always true in this driver.
> Currently the function does nothing and the driver seems to work fine.
> Because of the comment I'm not sure if the whole function can just be
> removed?

Yes, I agree. No later driver does anything with this routine, thus it is dead 
and can be removed.

Larry

