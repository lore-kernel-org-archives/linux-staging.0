Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F347E72
	for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 09:22:42 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id h1so3889795ljl.9
        for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 02:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6K808PPjkpTkbnbXiY0eI5Jv3rPmmxFhKf+SD20t3Yw=;
        b=jNbx/CXFJ1awFZl7w0ExP7cey9tcu5AznJzGiOYNNLAK43p44dAebQ6A0vjlReUkjO
         TNI1IqL3rSa+b0Vir7td6Footj1xXylICv/fmelssTYfz4QASNDahohRy1iuD8CYmIx5
         +6TWawSxNC4Gdr8N7HOuUESpr9BKnjZaBBqBhscH0VPL92CFF2avXpLDmuMBSCXw112G
         7VXxkEk8+aWh8crWn13n2MYo8sdTtQdwL5uz/qqwiHrwir53wFCaL/rESzCPe6LVnjnM
         yLmzwWlqORX81g7KqbuuK6eYRVlsCqGKlwUO1oAWW8ubr2Smpn/NOPfr1jm8FkSP2qsr
         FTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6K808PPjkpTkbnbXiY0eI5Jv3rPmmxFhKf+SD20t3Yw=;
        b=P1hrzjCkTMRqvMP3VFs4+r/2GOCZra0jxKnBjoOzYhf3z3kkczRtX7dC0DmTVGXoLj
         kLrGcR9zvYIfUDrEszmg3iBzH9ApCuusrfolEj8pS28p1aZU1ZZTP+dXt6qV7xz+JZa9
         2p2WWIwqlh9CBobW2uB+KXULxIrNdQMeddsAVEyN1IC1/3s1avmIswcc4ehmYEq8L20Q
         TnLylPsr1d6nR1RmP66q+MGfXXZECB8OtVak8ikKymMWf3wtqwtNq52+LYAdg2O2VtXX
         /5+6Lz9avmfb7p5Dz9Mx5jiLrBW7WtPcmhAf8hB7Q4E7qVF0Db1R7dedHHO+1hyrVcaO
         CeZQ==
X-Gm-Message-State: AOAM530erDCfEwgKNbwOq1q0tJSeXfE9l7tkFbPH150OWd/oMsWbkJDB
	1JOPvn8iQeT5pkSjK8EEbBY=
X-Google-Smtp-Source: ABdhPJw5oZHivTTL7qyRo6XSuDvVM9/9//tYX4v4wmnz4hk38RJ/BZo4mw0rSrjRJnuspTmwxBqo+w==
X-Received: by 2002:a2e:a88a:: with SMTP id m10mr2197733ljq.440.1629969760985;
        Thu, 26 Aug 2021 02:22:40 -0700 (PDT)
Received: from localhost.localdomain ([46.61.204.60])
        by smtp.gmail.com with ESMTPSA id z13sm285020ljo.37.2021.08.26.02.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 02:22:40 -0700 (PDT)
Date: Thu, 26 Aug 2021 12:22:21 +0300
From: Pavel Skripkin <paskripkin@gmail.com>
To: David Laight <David.Laight@ACULAB.COM>
Cc: "Larry.Finger@lwfinger.net" <Larry.Finger@lwfinger.net>,
 "phil@philpotter.co.uk" <phil@philpotter.co.uk>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "straube.linux@gmail.com" <straube.linux@gmail.com>,
 "fmdefrancesco@gmail.com" <fmdefrancesco@gmail.com>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 5/6] staging: r8188eu: add error handling of
 rtw_read32
Message-ID: <20210826122221.5d2b0f37@gmail.com>
In-Reply-To: <27f5e52d520b453cbcabb3d72f0f5d15@AcuMS.aculab.com>
References: <cover.1629789580.git.paskripkin@gmail.com>
	<93bf46ce2d0ce12e94672acf28b64dc341fde038.1629789580.git.paskripkin@gmail.com>
	<27f5e52d520b453cbcabb3d72f0f5d15@AcuMS.aculab.com>
X-Mailer: Claws Mail 3.17.8git77 (GTK+ 2.24.33; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 26 Aug 2021 08:51:23 +0000
David Laight <David.Laight@ACULAB.COM> wrote:

> From: Pavel Skripkin <paskripkin@gmail.com>
> > Sent: 24 August 2021 08:28
> > 
> > _rtw_read32 function can fail in case of usb transfer failure. But
> > previous function prototype wasn't designed to return an error to
> > caller. It can cause a lot uninit value bugs all across the driver
> > code, since rtw_read32() returns local stack variable to caller.
> > 
> > Fix it by changing the prototype of this function. Now it returns an
> > int: 0 on success, negative error value on failure and callers
> > should pass the pointer to storage location for register value.
> 
> Pretty horrid API interface.
> Functions like readl() - which can fail just return ~0u and let
> the caller worry about whether that causes serious grief.
> 
> You could make all the read functions return __u64 and return ~0ull
> on error.
> Testing for (value & 1ull << 63) will be reasonable even on 32bit.
> 

I am not the best at API related questions, so can you, please,
explain why your approach is better? 

As I can see, most of the drivers in usb/ directory use smth like this
interface for private reading funcions. We anyway creating tmp variable
(but 64 bit _always_) and checking for mistery error, which we cannot
pass up to callers.

Sorry, if it's _too_ dumb question, but I really can't get your
point....



 

> ...
> > -static u32 usb_read32(struct intf_hdl *pintfhdl, u32 addr)
> > +static int usb_read32(struct intf_hdl *pintfhdl, u32 addr, u32
> > *data) {
> >  	u8 requesttype;
> >  	u16 wvalue;
> >  	u16 len;
> > -	__le32 data;
> > +	int res;
> > +	__le32 tmp;
> > +
> > +	if (WARN_ON(unlikely(!data)))
> > +		return -EINVAL;
> > 
> 
> Kill the NULL check - it is a silly coding error.
> An OOPS is just as easy to debug.
> 


I don't think that one single driver should kill the whole system. It's
100% an error, but kernel can recover from it (for example disconnect
the driver, since it's broken).


AFIAK, Greg and Linus do not like BUG_ONs in recoverable state...
Correct me, if I am wrong




With regards,
Pavel Skripkin


