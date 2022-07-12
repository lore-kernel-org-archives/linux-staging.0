Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3422900
	for <linux-staging@lists.linux.dev>; Tue, 12 Jul 2022 10:43:40 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id l68so4478256wml.3
        for <linux-staging@lists.linux.dev>; Tue, 12 Jul 2022 03:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4LkU2gFRLGLr3NUPapRs0X2DdjMs6uNNL+JEKLrfvmM=;
        b=p37tJh6p3jzBrc7RSfYgdeoC+UdMrhRRAtBnPD4TeebMqU3kR9TeQQsREN2Ykx2jWa
         oQanbxiOv3iE5/RUzL5eFGza+3XVvDqi34QssZsIm57CtSjkDDMTyn2qHvaU/g78D70k
         3/7RqwsmiQCFLX7EFUp1nz+u1k0lMAm2pwemM/DErMtDIEbDRt+Y8MQw7SjPmWAIU1GM
         Z+SG/q3gnxMxOxsi/ntfcPXcH8sLkK3h0RWDCMI2zM4XJJpJFrOkpN1p4fmMwF4/46f0
         A0ZPx5vhxnbv32ZOyldhCiC+5Od8J6f73kW1jnLp3SqU49K+9TqBxOfdvGHZ4FxHx35z
         ZXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4LkU2gFRLGLr3NUPapRs0X2DdjMs6uNNL+JEKLrfvmM=;
        b=YgwDqyLXlKn1Z2CXqcRBycZhzo9QqefW790oA4AS2xeJt0OGnC2JUIxEDogxj/xKIV
         MnT7h0D64hMkAmve+1VSf7d82r+inH0ObvygZi7PmrUvTC19VpsjQK8K9ohsTK9Oeyz7
         fwUg18URsTyALTtBYvZMikCtDf1ifOWZT9l0XgohtNgoH1bfjhJVpWfPRHzLbyg8E8c8
         oBkeQlyvHCgkaehZUvW42s9wYuc8Rm06n7PpmpGOO37+Luw7BYrwVpbXAmN6ThAxjKfu
         IFkGI0xngf6cmUy4iRzDUkDIqN2bZIOueTEhL/zeURVfdX0CQNR5mCh3AyuD0wGRNJUP
         Dd/w==
X-Gm-Message-State: AJIora+0FZuGCPbWLEKXoA2JdxYt7jwmLF1MBQoWag33yXQ7ySEQwBgM
	jsbH/OCiskO2H8v2JD84ogo=
X-Google-Smtp-Source: AGRyM1u2+dvpXEqINB06jbRUw5pgMwmq2YxooJoPyEYMvvwV81AV3y9Z2PpU0hmB8aDN3beqinF0uw==
X-Received: by 2002:a05:600c:1992:b0:3a1:9252:c373 with SMTP id t18-20020a05600c199200b003a19252c373mr3025423wmq.140.1657622619200;
        Tue, 12 Jul 2022 03:43:39 -0700 (PDT)
Received: from opensuse.localnet (host-95-235-102-55.retail.telecomitalia.it. [95.235.102.55])
        by smtp.gmail.com with ESMTPSA id q5-20020adf9dc5000000b0021d928d2388sm7962308wre.85.2022.07.12.03.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 03:43:37 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tsuchiya Yuto <kitakar@gmail.com>, Martiros Shakhzadyan <vrzh@vrzh.net>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>
Subject: Re: [RESEND PATCH 0/3] staging: media: atomisp: Convert to kmap_local_page()
Date: Tue, 12 Jul 2022 12:43:36 +0200
Message-ID: <2264743.ElGaqSPkdT@opensuse>
In-Reply-To: <20220709174645.080fc795@sal.lan>
References: <20220707200718.26398-1-fmdefrancesco@gmail.com> <becfe58a-b4c3-4ae1-4ab2-456057ac7d22@redhat.com> <20220709174645.080fc795@sal.lan>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On sabato 9 luglio 2022 18:46:45 CEST Mauro Carvalho Chehab wrote:
> Em Fri, 8 Jul 2022 17:55:26 +0200
> Hans de Goede <hdegoede@redhat.com> escreveu:
> 
> > Hi,
> > 
> > On 7/7/22 22:07, Fabio M. De Francesco wrote:
> > > After waiting months, I'm resending three conversions to
> > > kmap_local_page(). I'd like to ask if there is anything which 
prevents
> > > these patches from being accepted.
> > > 
> > > Please note that these patches were submitted on April 2022.
> > > 
> > > For you convenience here are the links to the patches, the "Reviewed-
by:" 
> > > and "Tested-by:" tags:
> > > 
> > > [PATCH] staging: media: atomisp: Use kmap_local_page() in hmm_store()
> > > https://lore.kernel.org/lkml/20220413225531.9425-1-fmdefrancesco@gmail.com/
> > > https://lore.kernel.org/lkml/Yli+R7iLZKqO8kVP@iweiny-desk3/
> > > https://lore.kernel.org/lkml/2d096f20-dbaa-1d49-96e9-a7ae6c19f7fe@redhat.com/
> > > 
> > > [PATCH] staging: media: atomisp: Use kmap_local_page() in hmm_set()
> > > https://lore.kernel.org/lkml/20220413212210.18494-1-fmdefrancesco@gmail.com/
> > > https://lore.kernel.org/lkml/YldNhErgt53RqYp7@iweiny-desk3/
> > > https://lore.kernel.org/lkml/0b04ad1a-e442-1728-ef2c-bab386a4c64c@redhat.com/
> > > 
> > > [PATCH] staging: media: atomisp: Convert kmap() to kmap_local_page()
> > > https://lore.kernel.org/lkml/20220408223129.3844-1-fmdefrancesco@gmail.com/
> > > https://lore.kernel.org/lkml/b0aed731-b56f-4378-b50e-fc0cbccbdb84@redhat.com/
> > > 
> > > Fabio M. De Francesco (3):
> > >   staging: media: atomisp: Convert kmap() to kmap_local_page()
> > >   staging: media: atomisp: Use kmap_local_page() in hmm_set()
> > >   staging: media: atomisp: Use kmap_local_page() in hmm_store()  
> > 
> > Thanks, the entire series looks good to me:
> > 
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> Yesterday, I applied all pending patches at media-stage, including those. 
> Please check if  everything is ok, as I had to solve some trivial 
> conflicts.
> 
> Regards,
> Mauro
> 
I just checked those patches at media-stage and everything seems fine.
Thanks for applying them.

Regards,

Fabio



