Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56A77B
	for <linux-staging@lists.linux.dev>; Sun,  5 Feb 2023 15:34:32 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id cw4so9352897edb.13
        for <linux-staging@lists.linux.dev>; Sun, 05 Feb 2023 07:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ShtkLTPjNrJzQ0L8SVzCHY/1C+Lm1Un3JR+RBALXC6w=;
        b=ZYRSlffZ7dkgtXVrG3qS2GJdi/lX3qhPKeTobB5VVgCtg4Ka0a4GV/csaSwI0r/mHt
         oF3GQDFZi8deEprWblO7oRt6xZ8vjSqa16EVHzpxGhcR7s7JVLTlJOKseJ0NjsaRRsib
         Cyu95WUFtQUq5GcZq9YDuFgDe7aMR/q7cvE7hLYMZdaxGGUqDwVdzC/AMIuHlgrz6sXW
         0Z+qmv94pwuK4SM3EAh7YSjYqUXKkC0j6MCPO2RUOmso4L5zQdLM9DVh14/a31rzFv0K
         S7eHCMu3sLdV4UxvdRJ/wqMAaTRUAC03/y43nbl3P7vCdYEpuaMQO/w9+x0dx9G6zmwZ
         /5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShtkLTPjNrJzQ0L8SVzCHY/1C+Lm1Un3JR+RBALXC6w=;
        b=KA+58g4EIE/r89gM1sjLrWoZI9nJ3p4Kpto/TwC84f9bbG/t9Hlo67Bk32HHEic5Xr
         Tgpc5B+kyuWtetcByGosrNvmVCDwgNGBobmxywIP53Oi2sJzK9wUw5BF8IVvFhW3uV/g
         YD3UpusRbNm12ECNUjo3p08xfBB5iLbCAL1b7+eScgRGY3oWwWhP+9BLcHZs0azBWCrW
         q+NJ6dYUJ6Jo0ctXt/6z9fvREgvXomTjH3BF4dSTYPfoPYXzvLMl9bKOA5Btyl4PdZu3
         PzMri7mN5rDvQGvH7iC3aevSYkJdN86EGtHSTSIq42WID+Ak3TQkko9Nm1we5tLU/pED
         maAg==
X-Gm-Message-State: AO0yUKW37SiAbm0lLsQRGF44o8uAcZEEl8wCzcZJtsdvcE5YmiM6KSDu
	7sga/VKCt49+wcgYG7oOZ+0=
X-Google-Smtp-Source: AK7set8Sjcre6BymbpRvgzUlDPHHfWmar7l0fJB1FSQ/FOPgrAhR7OsE4wVC/rNTuhP+dzQ5un6uPQ==
X-Received: by 2002:a50:f69a:0:b0:4aa:a3b5:522 with SMTP id d26-20020a50f69a000000b004aaa3b50522mr4894358edn.12.1675611270936;
        Sun, 05 Feb 2023 07:34:30 -0800 (PST)
Received: from nam-dell (strongswan4.tue.nl. [131.155.9.107])
        by smtp.gmail.com with ESMTPSA id j10-20020aa7de8a000000b004a21c9facd5sm3865601edv.67.2023.02.05.07.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 07:34:30 -0800 (PST)
Date: Sun, 5 Feb 2023 16:34:29 +0100
From: Nam Cao <namcaov@gmail.com>
To: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Forest Bond <forest@alittletooquiet.net>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: vt6655: Macro with braces issue change to
 inline function
Message-ID: <Y9/MhS3pJ/Es0sGa@nam-dell>
References: <Y9+qMqYD2zGWRurD@combine-ThinkPad-S1-Yoga>
 <Y9+sFw0rviTAJNMf@kroah.com>
 <Y9+vkwYfQzYTbIIo@combine-ThinkPad-S1-Yoga>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9+vkwYfQzYTbIIo@combine-ThinkPad-S1-Yoga>

On Sun, Feb 05, 2023 at 02:30:59PM +0100, Guru Mehar Rachaputi wrote:
> On Sun, Feb 05, 2023 at 02:16:07PM +0100, Greg Kroah-Hartman wrote:
> > On Sun, Feb 05, 2023 at 02:08:02PM +0100, Guru Mehar Rachaputi wrote:
> > > This patch is to fix checkpatch warning: "Macro argument 'iobase' may be better
> > > as '(iobase)' to avoid precedence issues"
> > > 
> > > ---
> > > Changes in v3:
> > > 	- Whitespace error from checkpatch fixed
> > > 
> > > Changes in v2:
> > > 	- Macros with one statement that is to call 'iowrite8' function changed
> > > 	to inline function as reviewed by gregkh@linuxfoundation.org.
> > > 	In relation to this, names of the callers of macro are also modified
> > > 	to call this function.
> > > 
> > > Signed-off-by: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
> > 
> > Try to take this patch and apply it to a tree, and see that everything
> > below the --- line is thrown away, including your signed-off-by: line :(
> > 
> Sorry, should not a patch contain signed-off-by: line?
> I did not understand.

Patches must include signed-off-by. However your patch has it below the
--- line, and git will throw it away. You can try "git am <your patch>"
and see for yourself.

Best regards,
Nam
