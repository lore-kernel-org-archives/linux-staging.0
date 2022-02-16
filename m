Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E2238C9
	for <linux-staging@lists.linux.dev>; Wed, 16 Feb 2022 23:45:33 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id j9-20020a05600c190900b0037bff8a24ebso4850630wmq.4
        for <linux-staging@lists.linux.dev>; Wed, 16 Feb 2022 15:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=t0vNVKKYYCD2yT2Dy6f7J2Ql/gR8DYPpcEVuccfK2uU=;
        b=jX+QCI28dkeRL1yxzvM2i9T21YZmqXlAkK7p3SG42POwEcgWJEsGXOtPGKcT4s5dTi
         46D3LUkJgTUZd+6MkJajchePlaZEnLanbpO9reP8KY0o2bSkUZoI19ERP6lWEYEsqzXs
         mZAjJ3ul8buVuWQ7NTNV9w3O0oVtSwTry935YgEfSzQkpjGSK5Y6QvC6nVnUY3MaPF7m
         TAekftC4r4H1jucpHjWQ5LXoGLZfiNqrz/BTvUNmFKGWA/mNbUOPWSqjLSJORbOsNeDX
         pCe1exd1uLop9SLKQ3s/OZdvI+uziINM3MgWxh9Vb31Pg6Aat5DgehFLprOu1/5DPK+Y
         yi7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t0vNVKKYYCD2yT2Dy6f7J2Ql/gR8DYPpcEVuccfK2uU=;
        b=TSLSZHFH8FqoyoLD9jW7iHIbrF+GvAx5TLc+brF/7gf+np3wSB/cCUkUJCNfA9brd6
         XW/tLS38RcldVgVH5nFwzWvcdUULXCdtT1KjGVJ155YooNfMTNRMIyEJGlmoCpCMkeRW
         NLjub++Xoe3HxzYRT37OtcIVLAdVSTibv2oX3RldYj7bvYxtQ2RLWsXPlqHgcpuTNGXm
         43KuOXI6rK1dtrWkiWw2F9c7ZrsRkBQbU9PXsEj9Xd3l1WihUWuhGIu6l/nlghymF7Pn
         RUfCEG7esuh7EAB4kNc+i/PjI/Rwu7cdwuBek4nl01/5+tEvA0K0qToDc6KUawwdmd+/
         lYAA==
X-Gm-Message-State: AOAM532cHb1LCrzESM+h88Ol0aWCmlsDQ22wzz1Ak9LLcRuaEE2C50ky
	Bd1hPvA0ZqPTlLkz+N9WaUofew==
X-Google-Smtp-Source: ABdhPJyxAyLejiTSI1TIw2ZJt62HtMSE9qOwSX+WHfM8OZS3eG2K8WAT5bzPFk2pp9riJwPoTL0IqA==
X-Received: by 2002:a1c:4454:0:b0:37c:9355:2910 with SMTP id r81-20020a1c4454000000b0037c93552910mr3714736wma.150.1645055131741;
        Wed, 16 Feb 2022 15:45:31 -0800 (PST)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id b15sm34944052wri.96.2022.02.16.15.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 15:45:31 -0800 (PST)
Date: Wed, 16 Feb 2022 23:45:29 +0000
From: Phillip Potter <phil@philpotter.co.uk>
To: David Laight <David.Laight@aculab.com>
Cc: "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>,
	"Larry.Finger@lwfinger.net" <Larry.Finger@lwfinger.net>,
	"straube.linux@gmail.com" <straube.linux@gmail.com>,
	"martin@kaiser.cx" <martin@kaiser.cx>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"paskripkin@gmail.com" <paskripkin@gmail.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 15/15] staging: r8188eu: correct long line warnings
 near prior DBG_88E calls
Message-ID: <Yg2MmeJe1VGOQd4h@equinox>
References: <20220216010709.791-1-phil@philpotter.co.uk>
 <20220216010709.791-16-phil@philpotter.co.uk>
 <84f4a761263444c2940165dc403afb33@AcuMS.aculab.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84f4a761263444c2940165dc403afb33@AcuMS.aculab.com>

On Wed, Feb 16, 2022 at 10:01:18AM +0000, David Laight wrote:
> From: Phillip Potter
> > Sent: 16 February 2022 01:07
> > 
> > Where it is possible (without out-of-patch-series-scope large scale
> > refactoring), correct code to remove checkpatch warnings about lines
> > that are too long, also correcting operator spacing where appropriate
> > for these lines as well. These warnings occur mostly due to so many
> > DBG_88E removals and parentheses tweaks etc. being adjacent to such
> > long lines, which are therefore included in the resultant diff.
> ...
> 
> Somewhere my copy of this seems to have got its tabs deleted.
> I blame outlook :-)
> 
> > diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> > index ddc3a2c8aaca..d68611ef22f8 100644
> > --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> > +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> > @@ -382,7 +382,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
> >  if (protocol == ETH_P_IP) {
> >  struct iphdr *iph = (struct iphdr *)(skb->data + ETH_HLEN);
> > 
> > -if (((unsigned char *)(iph) + (iph->ihl<<2)) >= (skb->data + ETH_HLEN + skb->len))
> > +if (((unsigned char *)(iph) + (iph->ihl << 2)) >= (skb->data + ETH_HLEN + skb->len))
> 
> You can delete at least three sets of () from that line.
> 
> >  return -1;
> > 
> >  switch (method) {
> > @@ -451,7 +451,11 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
> >  pOldTag = (struct pppoe_tag *)__nat25_find_pppoe_tag(ph, ntohs(PTT_RELAY_SID));
> >  if (pOldTag) { /*  if SID existed, copy old value and delete it */
> >  old_tag_len = ntohs(pOldTag->tag_len);
> > -if (old_tag_len+TAG_HDR_LEN+MAGIC_CODE_LEN+RTL_RELAY_TAG_LEN > sizeof(tag_buf))
> > +if (old_tag_len +
> > +    TAG_HDR_LEN +
> > +    MAGIC_CODE_LEN +
> > +    RTL_RELAY_TAG_LEN >
> > +    sizeof(tag_buf))
> >  return -1;
> 
> That change really doesn't help readability at all.
> There isn't much point shortening it that much like that, especially
> since the here is a line that is nearly as long just above.
> 
> The real fix is to reduce the number of levels of indentation
> to something sane.
> I suspect that use of continue, break and return will help.
> 
> The other line length changes have much the same problem
> but not as sever.
> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 

Dear David,

Thank you for your feedback, and yes I totally agree - this patch was
more for procedure's sake to quieten the checkpatch warnings, but I was
in two minds about whether I should include it.

The indentation level is absolutely what is the problem here, but it is
arguably not in scope for this particular patch set given these are
pre-existing lines that have the issue. Certainly needs fixing though
for sure - just that this is more substantial and worthy of a separate
patch set in my opinion.

Looks like I need to do V3 anyway as I missed an unused-but-set warning
in patch 5 of the series. I may therefore drop this patch in V3 and
perhaps work on the indentation problem more generally.

Regards,
Phil
