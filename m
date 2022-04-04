Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A4D7A
	for <linux-staging@lists.linux.dev>; Mon,  4 Apr 2022 14:47:28 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id ot30so10526487ejb.12
        for <linux-staging@lists.linux.dev>; Mon, 04 Apr 2022 07:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mr7YWSWf9Fh5mx8DlwJhg4GGJWPL19lC/MOxR2q8iLM=;
        b=AtCNH6+qLl12Ug6eCiCqNuePjAcTpoPNw1iCqIx/6BeEJkZKJ2r2A/FwRnkTXyC5rM
         lEsG+RwBEkuX1fb0w9jo5BomEak7mLveAThWEODoGMM1NHmEzFFyp18MxsbXGJqc9Vbs
         NVAFME0UufgcpbPEmQFiab7xuRREsfnh6IBCCZYFMKcwZ7lFo9zVXVS5Q3j21wjC3N5N
         EJ6SGJPRm9VXBc0nuTZyOT8Vuus+vrgIzw6aNHweHSai15ka2cnDZT4S0IBIB1BtEq0U
         vQL/AgqEg0xNQXcFoG9kNf5xXl11+FhW4gVmdMBJO4KcON+QL+dJV7cAjDNxiL1WvuI1
         N/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mr7YWSWf9Fh5mx8DlwJhg4GGJWPL19lC/MOxR2q8iLM=;
        b=29xndDWx0Ae6VGcP/tAmJ3MvoUPf1HvdlGu9Pm8S9v7fbVff9yZj2BlaugVxH8zPF3
         1BtttOkf25QicqC+yPc/rvy0s4Hj54j2lcafTd10rCaEjtlta87NBb4gETMkotEC4omK
         7JSrGiTLOTbIf32VyEKUWEIXL6CrXlBep/VLD8UfdJ3vemet+zwp37/51ZTXgkE9qwEL
         ElU01VI9oCHJl6Pj/ixDUIZK5aPOH/jPISPTvyXppasAPw2E3pKFEYm9qQn23LftpgcY
         Vj1KEbPYv45VsXVI6+kUrGsu9yPcHYUFIjXnmo+OAwMg6eWuz1X70OlaD4GVfSBo0f21
         ukeg==
X-Gm-Message-State: AOAM530tRlYhkTrLf698ueKvBhDQhj/DjYHVkuX52Sj5S+Vrie13Fu0F
	2YZSH1HT6b5XFmpQfVyMqaE=
X-Google-Smtp-Source: ABdhPJw8S6m/1fNDQFpEzt4Ph+PTap1MEc8hF/iIt9eHY7l1piaaTbSxTLM55bPcr6dl63IabQUIew==
X-Received: by 2002:a17:906:3283:b0:6ce:78f9:fafd with SMTP id 3-20020a170906328300b006ce78f9fafdmr431125ejw.534.1649083646445;
        Mon, 04 Apr 2022 07:47:26 -0700 (PDT)
Received: from leap.localnet (host-95-249-145-232.retail.telecomitalia.it. [95.249.145.232])
        by smtp.gmail.com with ESMTPSA id gn3-20020a1709070d0300b006e1036666bfsm4409656ejc.223.2022.04.04.07.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 07:47:25 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Charlie Sands <sandsch@northvilleschools.net>, gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net, phil@philpotter.co.uk, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, paskripkin@gmail.com
Subject: Re: [PATCH V2] Fix unsafe memory access by memcmp
Date: Mon, 04 Apr 2022 16:47:24 +0200
Message-ID: <1723480.VLH7GnMWUR@leap>
In-Reply-To: <20220404143531.GE3293@kadam>
References: <YkpdVyuQguGzPSNE@sckzor-linux.localdomain> <1890716.PYKUYFuaPT@leap> <20220404143531.GE3293@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On luned? 4 aprile 2022 16:35:31 CEST Dan Carpenter wrote:
> On Mon, Apr 04, 2022 at 04:29:48PM +0200, Fabio M. De Francesco wrote:

> > Is it safe to access user space pointers without using proper helpers? 
> 
> No.
> 
> > In those cases I mean: is it safe without using copy_from_user()?
> 
> Correct.  You need to use copy_from_user().
> 
> > 
> > As I said, perhaps I'm overlooking something. However my conclusions 
> > follow by your own argument.
> > 
> > If I understand what you wrote, you asked to delete rtw_p2p_get()
> > because it looks like nobody "has ever tested or used this code".
> > 
> > rtw_p2p_get2() and rtw_p2p_set() use the same pattern of rtw_p2p_get()
> > when they access user space without using the proper helpers.
> 
> Those functions use "extra" which is a kernel pointer.  Which user
> pointer do they use?  Sparse doesn't detect it.

You're right, sorry. This is what I had overlooked. I took a brief look
(just 5 seconds or something) and saw the same arguments that 
rtw_p2p_get() takes and then a long list of calls to memcmp().

I overlooked that they were called using the 4th argument ("extra").

Sorry for the noise.

Fabio

 


