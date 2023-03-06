Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980A51362
	for <linux-staging@lists.linux.dev>; Mon,  6 Mar 2023 04:52:55 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id f18so11091404lfa.3
        for <linux-staging@lists.linux.dev>; Sun, 05 Mar 2023 20:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678078373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bIKcuXaJtu9JPlsmlDrsee9SwufGBzc6NChAPOq/9sM=;
        b=qsO/L2EfzQ+zk4Wf+LFY92Yl8ubRwp8n0WGHpk32ZoiwYd+CCUlWJOeHRoVFXyMHGr
         XlHMvlzq4i3mrFa/ptdVuZhJqSfXhWGlUDPQwswBT4NuTYpnnBFDsswYqyhTCu+CNSv6
         YpGLjgtKKACY94BCcAdNimHLWvVn9MBkzDVSHNwt/WxZ43WhDqYYG27ubnRVYe8gl14Y
         6z461L9c40AcczFQZga1yg+yyb3emrdIEIlK54dH3IX67unSEEpykNjBlWEkEn3YZ4kj
         WswTD5zqt+oy6N5z9bwYlRmBisLarxmdzbsLS4jo4h/6U8Ffn29o4zX811g58NzLAC/A
         dvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678078373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bIKcuXaJtu9JPlsmlDrsee9SwufGBzc6NChAPOq/9sM=;
        b=i0GajYCP+9koAy9AAndhNNvc9VvcYMr5F8CTwBI77k/GcGoWWPpocXjgEjNFgcKwmf
         c7axJ0Iwst77tDQ+et54Em3/1cVRIIWBnFd8TpXZBADsfFvf3bP4f/sWwDd9oA5nobiz
         Emzxltjh/Xd2/+fQ8MlGoqcbqimCj0/AbbRXtk8A7YzCxSF0Kyt6vwzV8nXAXMtEXG2/
         wZLMkY01NkWpFukKn2sLF6sLUA3jzpDFKzE6tw4SawhIOHPZgdypKXeSYHqUv0mlAk/T
         PX1iEeubo7GtYOLYfsj456S30iY3dxUuYNuA65gAbD/iAyb/CODlFzOm/Yu9EdF6aEqt
         uG0Q==
X-Gm-Message-State: AO0yUKWsPiE7gG+UVz833z9yXJ/PSjO0icZmxaF9hShf4bDRJuvY7sFm
	36X1RqR4UEoqPFRhsD1+GCc=
X-Google-Smtp-Source: AK7set/vP4+Z1tMqzZfYIzwRxTr5IHthrmMgqhRH7gMWkSo4e+UBJjz0g0k5gXRR4orAcukkRETuKA==
X-Received: by 2002:ac2:5969:0:b0:4d8:65c5:8684 with SMTP id h9-20020ac25969000000b004d865c58684mr3041043lfp.58.1678078373487;
        Sun, 05 Mar 2023 20:52:53 -0800 (PST)
Received: from combine-ThinkPad-S1-Yoga (c-8ff371d5.879159-0-69706f6e6c79.bbcust.telenor.se. [213.113.243.143])
        by smtp.gmail.com with ESMTPSA id m17-20020a195211000000b004d57fc74f2csm1470982lfb.266.2023.03.05.20.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 20:52:53 -0800 (PST)
Date: Mon, 6 Mar 2023 05:52:51 +0100
From: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
To: Deepak R Varma <drv@mailo.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Forest Bond <forest@alittletooquiet.net>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: vt6655: Macro with braces issue change to
 inline function
Message-ID: <ZAVxo6WHGu3kO1nl@combine-ThinkPad-S1-Yoga>
References: <Y9/xXHvOAwfqoDxn@combine-ThinkPad-S1-Yoga>
 <3cb45313-209a-8190-12f8-6a2d49e4173b@wanadoo.fr>
 <Y+A+HF1vDeRIqye5@combine-ThinkPad-S1-Yoga>
 <Y+DL3O5lcMyZ/aNR@kroah.com>
 <Y+H9BT8Am4Ik2ZDA@combine-ThinkPad-S1-Yoga>
 <Y+IJgxF52lpgk0RC@ubun2204.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+IJgxF52lpgk0RC@ubun2204.myguest.virtualbox.org>

On Tue, Feb 07, 2023 at 01:49:15PM +0530, Deepak R Varma wrote:
> On Tue, Feb 07, 2023 at 08:25:57AM +0100, Guru Mehar Rachaputi wrote:
> > On Mon, Feb 06, 2023 at 10:43:56AM +0100, Greg Kroah-Hartman wrote:
> > > On Mon, Feb 06, 2023 at 12:39:08AM +0100, Guru Mehar Rachaputi wrote:
> > > good luck!
> > > 
> > > greg k-h
> > 
> > Thanks for taking time.
> > 
> > If my understanding is correct, every version of the patch should
> > include all the patches/patchfiles and it should explain what happened in each
> > version(in decrement order) through a coverletter. Please correct me otherwise.
> 
> Hi Guru,
> Other than the cover letter, each individual patch should also include the patch
> version history in the descending order. If a specific patch(es) that is/are
> part of a patch-set, did not have any change, we should still increment its
> version and record "none" as the change in current version for such patches.
> 
> However, from the patch-set, any patches that are acked, do not need to be
> resent along with other patches that are still under revision. But do mentioned
> about such accepted/acked patches in the cover letter.
> 
> Hope this helps.
> 
> Thanks,
> deepak.
> 
> > 
> > I do refer "first patch submission" and above is my current
> > understanding.
> > 
> > -- 
> > Thanks & Regards,
> > Guru
> > 
> 
> 

Hej Deepak,

I have a problem in sending patchset through mutt.
I have been trying sending to my own mail address but it won't work.

When sending patchset I think we should use "In-Reply-To" flag and
include "Message-ID" to which we want this to be in series to. I tried
both "git send-email" feature and mutt "forwarding feature".

Another issue is, how to attach patch file from inside mutt(for example: 
"mutt -H x.patch" from command line is used to extract header and body of a 
mail in mutt)?


-- 
Thanks & Regards,
Guru
