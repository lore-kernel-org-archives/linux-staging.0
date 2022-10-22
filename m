Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24B07C;
	Sat, 22 Oct 2022 07:35:31 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id s3so2972836qtn.12;
        Sat, 22 Oct 2022 00:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTgwvmCwshFQNtdtBgqjMRnvCyC/Xl8rvUH5mkou+6w=;
        b=an7tzkeyjHNGfmNqiV8MF7LnV+EamsmZjtpaDzasnoGpc0ZthGxdDMMSjpBqpcTxtf
         T8DPHXNttV7ep4IxxyzusqdRTidcXxstFwEGJVWSrlsIGHdX9eutFo4pEi1kHY658KRt
         b8RNoZpjZ2F44VL4JUL81Rp7+ygYPc3lGxoQCWwMfg/yCT584jlEWuQZgoDYe2/3yuZb
         S4w6XKqD7CPr1YepVVT3QdU7wTMMxf7coBIazsMMdc00HId6Al8KURBe09PspIKuX6i3
         gNfQN9ia+tNEBVsiAiH4mnAFPKo8meHgOVPowCMjqxg8ugXWvTbZCjrBaUibdBcmUifa
         P0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZTgwvmCwshFQNtdtBgqjMRnvCyC/Xl8rvUH5mkou+6w=;
        b=XrBAuRHAXseA3e8k2KSABc3YapbjFDIeh5radGMqi36peQSchnIgQoa4j+ewtP4xwV
         8t/So1fvrdKWZy+XSBefKkhVFjeNvEWKNpAvlN7+ad8EWgxtM7ZLPqJkWNqiRJAfBGX1
         dpVwb+pU4lLGET6ltOqowRy/dFu8N/w+h85t03YV0Pcyi91y13lfjBsStUDXkMoI34MH
         LJNi/rdS2jfoMSfCsOKP7jzQeVn1BGEXLldzT9FutFs8hmx5orE2pMmpEzXANe7f+3NC
         OkrQqEHJGheGDHJRYwtoTmKBDQJd+/V1AKnwg1NwsUHGZ9iQ0cFkvFpa1bWyCiJV+4lN
         A0vQ==
X-Gm-Message-State: ACrzQf3hiLJf9/Qu62DIIClBfM+GPa2caLaOnzz4yskJpFiEfWtW+MWe
	2hvG1+tWG4c3N0zFTZ5f+wh8SbMNFT8/w/7Zhdc=
X-Google-Smtp-Source: AMsMyM7uLuNV6EpVW8mxH8VqxE3DFqPy5Qu2WdFiwjqBl/ewFeWLLSesYfHyTOJXNTow/F9voRX180fgU3ywsAQHALo=
X-Received: by 2002:a05:622a:411:b0:39e:354e:b537 with SMTP id
 n17-20020a05622a041100b0039e354eb537mr5632545qtx.656.1666424130617; Sat, 22
 Oct 2022 00:35:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221022070612.13009-1-tanjubrunostar0@gmail.com>
 <20221022070612.13009-2-tanjubrunostar0@gmail.com> <cae0a94e73b1e44a7d8c750a406aa77d1942a06a.camel@perches.com>
In-Reply-To: <cae0a94e73b1e44a7d8c750a406aa77d1942a06a.camel@perches.com>
From: Tanju Brunostar <tanjubrunostar0@gmail.com>
Date: Sat, 22 Oct 2022 08:35:18 +0100
Message-ID: <CAHJEyKU1qSoSy3AB0sJL7OAtkQX3H67dCL2ZFTMdb913F5oURQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] staging: vt6655: fix lines ending in a '('
To: Joe Perches <joe@perches.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 22, 2022 at 8:18 AM Joe Perches <joe@perches.com> wrote:
>
> On Sat, 2022-10-22 at 07:06 +0000, Tanjuate Brunostar wrote:
> > fix serveral checkpatch errors related to lines ending with a '(' by
> > refactoring the code lines
> []
> > diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> []
> > @@ -141,13 +141,11 @@ static __le16 vnt_time_stamp_off(struct vnt_private *priv, u16 rate)
> >   */
> >  static
> >  unsigned int
> > -s_uGetTxRsvTime(
> > -     struct vnt_private *pDevice,
> > -     unsigned char byPktType,
> > -     unsigned int cbFrameLength,
> > -     unsigned short wRate,
> > -     bool bNeedAck
> > -)
> > +s_uGetTxRsvTime(struct vnt_private *pDevice,
>
> If you end up doing more work here, ou might consider removing the
> Hungarian style notations
>
> Maybe something like:
>
> s_uGetTxRsvTime -> get_tx_rsv_time
>
> > +             unsigned char byPktType,
>
> byPktType       -> pkt_type
>
> etc...
>
> Perhaps patches by unique rename.
>
Yes I plan on doing that as a separate patch. It could be overwhelming
keeping track of so many changes at a time
thanks
Tanju
