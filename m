Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53662F27
	for <linux-staging@lists.linux.dev>; Mon,  7 Feb 2022 17:17:10 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id j14so20728479ejy.6
        for <linux-staging@lists.linux.dev>; Mon, 07 Feb 2022 09:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KqWHPeQUhcY5pZInVEVMHNlzWbOZP7wLpS7JnXkibBI=;
        b=ftbKa5q8huDDBWvM/7WVkwx5nuP/h2h7d5mvSFkiKYylYnsvX9g5LuF1HNmiOcaz99
         r/Kduq3dT/gKLkzIO38zbdA5NAWwaZJ53tAZoTPO6lMw1TM3NytchFU7KBevEYZPn+AZ
         A+yp9zwdaIA5Fjv5okwQAEmYB6zg6wkUg36PVLYqtHas4XbTpBgZ2+NzcCCyjD4d/+H3
         VD8+n5SCJzeZd7q9bTgH2WKJAnyWBcMdUtZJULx6OemkACykV3kCa1UTIVn8+AF9vrki
         GDq8xhIgPT40h8yuVNO+kIRbZi0b7ExfWWm26r/OJIuXbL2F5BEHvy+zSJUKx0APEIwE
         ZFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KqWHPeQUhcY5pZInVEVMHNlzWbOZP7wLpS7JnXkibBI=;
        b=FZXLBstsSWfsBdasAWVrxvmEK/BhVjtP4Io0fpnfKhYp5eBsqIq3vTMFEJDTq3/5vK
         ToX4zQtbfsRSzPwgImCUO7UAwoAZ3315QdVl4YF3366tKxDoLyv3xHpyzajIAmy76SaV
         naSt3RO1Mbu3GHFHdL2rxv+AYKSETF6s6kIVP7cu4rMcUHFUOW0m8QFQMTWQU/ExjYq4
         K8mf0U5c74QnrVOPLKZUv7H2Jl+pqdh37HgdhkVE5QrSiYQX/dHBcDLpfSIOIjr3zQQ3
         i2jLphbFzFbjr6asPT0mqg2A0yPBplj8iko+MhvTCliaO45J/mp7xq4VCpbdk7cPVqwB
         8nZg==
X-Gm-Message-State: AOAM530Y5jnHnwGOKlouaQ/2kuB7HRC+1vhLfzDNwzJg5RsP57H7Ljd2
	pq/mmamy3JuPy7RFrULMwGk=
X-Google-Smtp-Source: ABdhPJx3p0KrWaYKFZKiwbYzzNRz6taCMtuwfW2PWtsHWJDM8NahmGAXbQd0Cgd1WysYep88Er46YQ==
X-Received: by 2002:a17:906:58cc:: with SMTP id e12mr582714ejs.162.1644254228902;
        Mon, 07 Feb 2022 09:17:08 -0800 (PST)
Received: from leap.localnet (host-95-245-2-16.retail.telecomitalia.it. [95.245.2.16])
        by smtp.gmail.com with ESMTPSA id m22sm3931377ejn.194.2022.02.07.09.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 09:17:08 -0800 (PST)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org, phil@philpotter.co.uk, larry.finger@lwfinger.net, julia.lawall@inria.fr, linux-kernel@vger.kernel.org, Michael Straube <michael.straube@stud.uni-goettingen.de>, martin@kaiser.cx
Subject: Re: [RFC] staging: r8188eu: Sleeping in atomic context (SAC) bugs
Date: Mon, 07 Feb 2022 18:17:06 +0100
Message-ID: <2092556.irdbgypaU6@leap>
In-Reply-To: <23161490.ouqheUzb2q@leap>
References: <2111927.Icojqenx9y@leap> <20220207092133.GE1951@kadam> <23161490.ouqheUzb2q@leap>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On luned? 7 febbraio 2022 15:18:52 CET Fabio M. De Francesco wrote:
> On Mon, Feb 07, 2022 10:21:33 CET Dan Carpenter wrote:
> > On Mon, Feb 07, 2022 at 01:02:17AM +0100, Fabio M. De Francesco wrote:
>
> [...]
>
> You're right: "if (check_fwstate(pmlmepriv, _FW_LINKED))" in _rtw_pwr_wakeup() 
> will prevent a call to ips_leave(). Therefore, it seems that we have no problems
> with the mutex in ips_leave(). 
> 
> I had not noticed the above-mentioned "if" test. Sorry :(
> So, let's leave the code as it is.

I'm writing again just to be sure that I made my argument clear. When I wrote 
"[] let's leave the code as it is [currently]" I was referring to the mutex_lock() 
that is _never_ reached while holding the spinlock that rtw_set_802_11_disassociate() 
takes before calling _rtw_pwr_wakeup().

Instead, if no one objects, I want to substitute the two "msleep(10);" with 
"mdelay(10);".

However, I'll wait some time just in case someone wants to suggest a better 
solution.

Fabio

 
> Thank you very much.
> 
> Regards,
> 
> Fabio M. De Francesco 
> 


