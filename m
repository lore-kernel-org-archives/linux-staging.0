Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCB33FC1
	for <linux-staging@lists.linux.dev>; Fri,  3 Sep 2021 15:49:58 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id r2so5911288pgl.10
        for <linux-staging@lists.linux.dev>; Fri, 03 Sep 2021 08:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H+y3G6ZLNVNe2FLAUHvKre0bJLsO9td0ygyxLkukKLM=;
        b=TmVGsRZFiW76qHDRSBmsNquJ9FU3UlnM+0LfVqC54A2tZfuGUZMTe6BR77HlaMZRTw
         WkyXh3EA0moDBv9vgLfkDYntPkac7R9J+UR4NRyO+RStkRlxul9T+hpLvj18JtXxKDTN
         kGotR2pmzihIMXJq7OA5K1DLeZ+ztofKxaNx+iFTdp5KycD8lud5LwSv42pFciZkCExF
         U1bjiXFJHUDK70xabe0NAtJi4yk2LZ9ugRpbmoTNV50g5R8AB8xfUZIl8aMS8KlRywyy
         iRvvRFmPn4JTp8qRRYMkU2C8Zei6Rr/BMgrBhEE0iR0Y+jbXbGAFXuKQoDQ+apWNiA8M
         Cu1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H+y3G6ZLNVNe2FLAUHvKre0bJLsO9td0ygyxLkukKLM=;
        b=LdS+SXTfnB1B/cR5wiMaTO8HlOr/PuRs4vEBaBsw8wC9xixw2fAIVYYBfv2FHh8pb3
         XiJFiqPbELRaCR28+cg1my6Bl+VSYDAXVa7McnboXew1rhCXpnSeHu1Kc9trs/Uf0gZG
         mKGtmugJDtUSTy9Ac1guUFZgbdqfU0ywNsp8cDUToAuyxcXA55b3dTP7u+YeAOFOhgok
         0PUYaA9/xEM8wIVZ2qL5Y+aO4iD/e5DxDOvfDYUTITHKdUP/8fQcjMnylJZromoZzHqa
         YCk2HIbxo9sVEWbxJrDMHn8nSL2H339EEdA0WhluikYkh1aqZUDhNTgpRpT3HD3+EZqL
         Rwgg==
X-Gm-Message-State: AOAM5306Azz3VjV2n3qJVDYlmOHVi5LUQNeldlM35AnaoKovJKSL1Wuk
	rPlHY4jKMmC6nm1XHsoE66l1RgyBbmpQnKacWUiValIAL3HL4w==
X-Google-Smtp-Source: ABdhPJxpU3nZzqQE5GPm8DLAAKnjsXCx0CBCijF43v/m8TJ4bPpNED0gr0TaLghTKxfAes3iMe9bSvWTnqcUq60YmqY=
X-Received: by 2002:a63:101c:: with SMTP id f28mr4159207pgl.330.1630684197652;
 Fri, 03 Sep 2021 08:49:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210902111339.GA577108@panther> <YTCU3SpFgyFbxXs3@kroah.com>
In-Reply-To: <YTCU3SpFgyFbxXs3@kroah.com>
From: Krish Jain <krishjain02939@gmail.com>
Date: Fri, 3 Sep 2021 17:49:46 +0200
Message-ID: <CAPGkw+xhPfD0acY1GcwPpHg=kHw7o2+y94-r3AxfzsfyqG4bDw@mail.gmail.com>
Subject: Re: [PATCH] Fix formatting for file "hsdma-mt7621.c"
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 2, 2021 at 11:09 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Sep 02, 2021 at 01:13:39PM +0200, Krish Jain wrote:
> > This patch fixes the format of the code. It properly formats lines that should not end with a '(' as suggested by checkpath.pl.
>
> Please properly line-wrap your changelog text like your editor asked you
> to.
>
> Also, your subject line needs work, look at other commits for this
> driver with:
>         git log --oneline drivers/staging/mt7621-dma/
> and notice how they say the driver name and the subsystem.
>
> Please fix up and resend a v2.
>
> thanks,
>
> greg k-h

Do you mean I should line-wrap (at 72 columns) the entire thing or
only that line? " This patch fixes the format of the code. It properly
formats lines that should not end with a '(' as suggested by
checkpath.pl."

Best Regards
