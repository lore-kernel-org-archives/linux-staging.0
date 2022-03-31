Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341F37E0;
	Thu, 31 Mar 2022 14:27:57 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id q14so32199534ljc.12;
        Thu, 31 Mar 2022 07:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H9zw51UkEooU51O6uDBnpMaIip01pIRg5ivq80VWb3U=;
        b=dRY7km9LLsGbpfH2PHYxfYob9jbeOynMEAO/kWim3KrRNdgJxJ3NK6SE6H8LDcWKNw
         HeMnEj8ohb2DYFBeUtTwi7U0DLfutVRkxhSZeMgozmQ3cDiaoXlpZHspOlEZOdKXi1Kz
         fnV4dJGMeVAlA0NfXAxoVYh4AIazbO9zGUmulBGJLzvyhGkAGn2sbPCWh6qBDk9P2vrV
         BsHv+pVCg2K0dyrBr9Z5e5XFjdkbJEgH0ZPnBkXLyyzc3bOLaRmEFv3tqRwHu+53DlmW
         OPYPgC0GzIVaabGz9lIl30Vc8A+Ext/OQZ3A0itOoqfLv1sOsVO7+kzlzRq9AtC8BTN8
         N1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H9zw51UkEooU51O6uDBnpMaIip01pIRg5ivq80VWb3U=;
        b=tFW4bjOL4+y4h8noWap26ByG68OBvT9R3cqyIRpO/+eFH7RBM/MIJOF95DHLm5jCiV
         d5nAwW5RDV7EnsYO2E3g5gBzlwG92KW8LEpOJ7s0E/+k3FuTf/L1APRy73TXcRyrLGbx
         V815DwhXxcRfwW/pPomhisUzfue5+I0CXYiVUIf8cpwnsmqZ9KyvUcTamBzOo0E9P2F0
         TPgdSNsOZ+/jNkewEJ/n5WxswpYrBwRhQsaTjUSCJq8sxwJIYJmf9FaFYkEdrw7yF3JY
         bWMayPJY2i3RmPIp4cEJx6upEIf6oMqyibRSYSCaDM3OyITIqWcmC/Mdnw9Lk+Arqsaq
         hj4A==
X-Gm-Message-State: AOAM530wVtplpQwb7IMcBFyt7El2OPhi2mXoBopU1Q1hy0StXpbbY0Dg
	kEegasZ6dYcba7IjmFnkO9cmKwI8IN4vMTqDjoc=
X-Google-Smtp-Source: ABdhPJxtcIvjAHcxVvUeKdeZsuMITYP3rijJH8qEnONOOmqnKTwnbUB8YtzM+WgoRvuTY4WQNTo2/qujvxZvRW5eoCQ=
X-Received: by 2002:a05:651c:158e:b0:248:1ce:a2a with SMTP id
 h14-20020a05651c158e00b0024801ce0a2amr10246261ljq.172.1648736874967; Thu, 31
 Mar 2022 07:27:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220331122618.GA434796@euclid> <20220331141456.GP3293@kadam>
In-Reply-To: <20220331141456.GP3293@kadam>
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
Date: Thu, 31 Mar 2022 10:27:43 -0400
Message-ID: <CAMWRUK5q8tadCVD-AbFCjQs2qvnvZG8Pyg+W+jt52g=sVDB5bw@mail.gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: place constants on the right side
 of tests
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 31, 2022 at 10:15 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Thu, Mar 31, 2022 at 08:26:18AM -0400, Sevinj Aghayeva wrote:
> > Adhere to Linux kernel coding style.
> >
> > Reported by checkpatch:
> >
> > WARNING: Comparisons should place the constant on the right side of the test
> >
> > Signed-off-by: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
> > ---
> >
> > v1 -> v2: Missed one case of constant being placed on the left. Now
> > checkpath reports no such warnings for this file.
>
> You need to send a reply to the original email "Hi, please ignore this
> one, I spotted another line I want to clean up" so that Greg does not
> apply it first before reading this one.

Got it, thanks! Will do so in the future.

>
> regards,
> dan carpenter
>



--

Sevinj.Aghayeva
