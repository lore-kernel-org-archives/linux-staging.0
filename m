Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566B47B;
	Fri, 15 Apr 2022 09:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=1IB+AYrMADaOCol/Ics482qObTIxCkr1TUEEibKg3ZM=;
  b=fHSLbC+OQzDO7QbF10PsD5NMNxwvyNu3/bChaFGSYyXWM2cXeez/iLvr
   uL+NlmjQMzvE0fzOHzREnmrGnbLPIVoIrj1196b7S8xqpD2sUdKECvnOO
   sz33g4rvJSAeMYqXaTp8V9jhflZKdI7uF+j04GIQg7QMF6isfKUSkCwkK
   U=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,262,1643670000"; 
   d="scan'208";a="31846000"
Received: from 203.107.68.85.rev.sfr.net (HELO hadrien) ([85.68.107.203])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2022 11:08:30 +0200
Date: Fri, 15 Apr 2022 11:08:29 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
cc: forest@alittletooquiet.net, Aliya Rahmani <aliyarahmani786@gmail.com>, 
    gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
    outreachy@lists.linux.dev
Subject: Re: [PATCH v4] staging: vt6655f: rxtx: code style - Fix Lines should
 not end with a '('
In-Reply-To: <1749887.3VsfAaAtOV@leap>
Message-ID: <alpine.DEB.2.22.394.2204151107350.3175@hadrien>
References: <20220415051900.5801-1-aliyarahmani786@gmail.com> <1749887.3VsfAaAtOV@leap>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1404162921-1650013710=:3175"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1404162921-1650013710=:3175
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT



On Fri, 15 Apr 2022, Fabio M. De Francesco wrote:

> Hi Aliya,
>
> I think that the subject of your patch can be reduced a bit. For example,
> why don't you remove that "code style -"?
>
> On venerdì 15 aprile 2022 07:19:01 CEST Aliya Rahmani wrote:
> > Code style warnings reported by checkpatch.
> > Improve the layout of a function header:
> > *Put the first parameter immediately after the '(' and align the other
> > parameters underneath it.
>
> You are doing two different things. Please only one logical change per
> patch. Furthermore, why that "*" before "Put"?

I think that fixing up a function header could be considered to be one
thing?

But the subject line should reflect the complete one thing.

julia

>
> >
> > Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
> > ---
> > v1->v2 changes: Put static and void on a single line.
> >
> > v2->v3->v4 changes: Rework commit description.
> >
> > ---
> >  drivers/staging/vt6655/rxtx.c | 23 ++++++++++-------------
> >  1 file changed, 10 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/
> rxtx.c
> > index 53506e242a96..01dc83b2f4bc 100644
> > --- a/drivers/staging/vt6655/rxtx.c
> > +++ b/drivers/staging/vt6655/rxtx.c
> > @@ -567,19 +567,16 @@ s_uFillDataHead(
> >  	return buf->duration;
> >  }
> >
> > -static
> > -void
> > -s_vFillRTSHead(
> > -	struct vnt_private *pDevice,
> > -	unsigned char byPktType,
> > -	void *pvRTS,
> > -	unsigned int cbFrameLength,
> > -	bool bNeedAck,
> > -	bool bDisCRC,
> > -	struct ieee80211_hdr *hdr,
> > -	unsigned short wCurrentRate,
> > -	unsigned char byFBOption
> > -)
> > +static void
>
> Why storage class and function type are on a separate line? Is it a special
> convention for this driver?
>
> > +s_vFillRTSHead(struct vnt_private *pDevice,
> > +		unsigned char byPktType,
> > +		void *pvRTS,
> > +		unsigned int cbFrameLength,
> > +		bool bNeedAck,
> > +		bool bDisCRC,
> > +		struct ieee80211_hdr *hdr,
> > +		unsigned short wCurrentRate,
> > +		unsigned char byFBOption)
> >  {
> >  	unsigned int uRTSFrameLen = 20;
> >
> > --
> > 2.25.1
>
> Thanks,
>
> Fabio M. De Francesco
>
>
>
>
--8323329-1404162921-1650013710=:3175--
