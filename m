Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE423107B8
	for <linux-staging@lists.linux.dev>; Sun,  5 Feb 2023 18:13:22 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id ud5so28419491ejc.4
        for <linux-staging@lists.linux.dev>; Sun, 05 Feb 2023 10:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MADvd4KXk+Pnv+BnuUONBLxS8C2Yx/vqJbKEF2lRq+I=;
        b=M+cWHvWkpsU8P1Dpa6MInG0nswK3denIMCrzJ4taB2EHkck0MFw71A8T2Evn/SqEjs
         VDTjTo1HOKz6HnYk8UEkBQdVDaErUF7ecz1M8gsqPZ5PgdotNDwdoUX2d/hBgDXn8ty+
         J1rZGJEePTeFteNJbouBt0tQt3fyDpDVl+MkvfXXZhOfg1a0JUMaZbP4xeYo57lR4pfU
         PoGmuglPHWrT+2IKL1+1rMcZeKW9WstJlXah9UXKeCFV7yQreH52i7tqOeiL0Sn6lTzm
         ordkl1H8uJMLqepzPKDpkD7VyXUDviMu8RnOoY2dZ05NVhJyDHKcTv5+1XjI9Vjm6bUi
         vy+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MADvd4KXk+Pnv+BnuUONBLxS8C2Yx/vqJbKEF2lRq+I=;
        b=0rvHS5kOrRAaFAJEdXRcMU8xf90k8/Y+M4FdCzdqLYr3FXqa5Qn9ToIxmyt7QJWS/w
         RzbDbsNcnr0yrsULdduUIqIMQFEOteIBsl/DYOoRieuf9ZdgLqM2cBsPgSeWACvWnEk9
         j7BkhGoeVh//yHV4eI4E91cTwnrP3kB2H0dNXyqL4sn5/ZydJzKho4u8+Z4f/UiZSTFi
         zaPhPdCnERwbVVa9fwVXPfBhPvRoMoGryJOPoiOpH2UEkYo77EcPL0dPDWIcXbmdok23
         voi+NUwnLJKyipOcqq1zi4gTOh2zZnk5tykt3I4dkCslwIjufODwIXDRgYGteD5f97bv
         1R2w==
X-Gm-Message-State: AO0yUKXjrGCk0TwqvMJ7rjIrXtwSuBmGGj/kL19ZoqeMF+dD3JPjtJn2
	+xs+8cHGqSTnhYnV7v7RiQfXH+En2GQ=
X-Google-Smtp-Source: AK7set/CRN2+pSypVmV/volOfAyQuzaPZtEf6TefJnBoxmJfkzTXBPRMsnG4JkjBF46b/4H+UxxqQg==
X-Received: by 2002:a17:906:60d1:b0:886:6f92:2bd2 with SMTP id f17-20020a17090660d100b008866f922bd2mr16913839ejk.21.1675620801081;
        Sun, 05 Feb 2023 10:13:21 -0800 (PST)
Received: from combine-ThinkPad-S1-Yoga (c-8ff371d5.879159-0-69706f6e6c79.bbcust.telenor.se. [213.113.243.143])
        by smtp.gmail.com with ESMTPSA id gw1-20020a170906f14100b0087bd4e34eb8sm4335679ejb.203.2023.02.05.10.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 10:13:20 -0800 (PST)
Date: Sun, 5 Feb 2023 19:13:18 +0100
From: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
To: Nam Cao <namcaov@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Forest Bond <forest@alittletooquiet.net>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: vt6655: Macro with braces issue change to
 inline function
Message-ID: <Y9/xvjlxufB700Kc@combine-ThinkPad-S1-Yoga>
References: <Y9+qMqYD2zGWRurD@combine-ThinkPad-S1-Yoga>
 <Y9+sFw0rviTAJNMf@kroah.com>
 <Y9+vkwYfQzYTbIIo@combine-ThinkPad-S1-Yoga>
 <Y9/MhS3pJ/Es0sGa@nam-dell>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9/MhS3pJ/Es0sGa@nam-dell>

On Sun, Feb 05, 2023 at 04:34:29PM +0100, Nam Cao wrote:
> On Sun, Feb 05, 2023 at 02:30:59PM +0100, Guru Mehar Rachaputi wrote:
> > On Sun, Feb 05, 2023 at 02:16:07PM +0100, Greg Kroah-Hartman wrote:
> > > On Sun, Feb 05, 2023 at 02:08:02PM +0100, Guru Mehar Rachaputi wrote:
> > > > This patch is to fix checkpatch warning: "Macro argument 'iobase' may be better
> > > > as '(iobase)' to avoid precedence issues"
> > > > 
> > > > ---
> > > > Changes in v3:
> > > > 	- Whitespace error from checkpatch fixed
> > > > 
> > > > Changes in v2:
> > > > 	- Macros with one statement that is to call 'iowrite8' function changed
> > > > 	to inline function as reviewed by gregkh@linuxfoundation.org.
> > > > 	In relation to this, names of the callers of macro are also modified
> > > > 	to call this function.
> > > > 
> > > > Signed-off-by: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
> > > 
> > > Try to take this patch and apply it to a tree, and see that everything
> > > below the --- line is thrown away, including your signed-off-by: line :(
> > > 
> > Sorry, should not a patch contain signed-off-by: line?
> > I did not understand.
> 
> Patches must include signed-off-by. However your patch has it below the
> --- line, and git will throw it away. You can try "git am <your patch>"
> and see for yourself.
> 
> Best regards,
> Nam
Oh I see. Thanks for that. I changed it now.

-- 
Thanks & Regards,
Guru
