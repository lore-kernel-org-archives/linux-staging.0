Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125DC2CA1
	for <linux-staging@lists.linux.dev>; Mon, 31 Jan 2022 19:30:39 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id z10-20020a17090acb0a00b001b520826011so113504pjt.5
        for <linux-staging@lists.linux.dev>; Mon, 31 Jan 2022 11:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gyaD8qPhQQxiUsgl19Fa58voK0du9zBveZZ7eFx9ZSw=;
        b=Q90Y79EwEqu8irEhc7lCqS3XLtYpcSC5ckBzDm3uVDccGuXzfSGxsn+66JeDKmaX7I
         iwWBdqGIZLWAOZMIUA1g0VLlpYhhhL8a+IPRZmgZzcystG5a9lZhMBfP54judzI+heoI
         mEF7IgR0cVsxj0PFC8ldh7CDT4kzXSWxvnoSsXKMAXfGpoWS0fYO86bRnJi5Cs8Xljmd
         4hMXEkvaAm5N+dHJOYmxT1L+oFXbcD9XK7H4R3BsG1e+cyPSOirbCBZG5Ud7vIa83F+K
         Gti1FZAO/GPjEepInLYX3UQ9TwrjYdYx647ppxb6XdM8OFmiBw/cUBYr7+gYmbn/Sg9Y
         bVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gyaD8qPhQQxiUsgl19Fa58voK0du9zBveZZ7eFx9ZSw=;
        b=duKeygvGQo9TfVoIU9eurkgBkxkljhK3yGSfqamNctaqzRoAMv69UV7jAsMLZD417d
         fgq42ZeK6RsYxRferdEkEEQ0brB3QC/M/aBdxnT/NBAE0nRo9GjBkC3we5SjPuiGg/MC
         Ag92v4zRtrFpzKvG5V72juUz8QIfuJOT7Alz3dJKR+fTB+aNgzzpIm2d4LdVhFwQS5PG
         2vnkIMBB/Ba0GwnzpYsAtaDWMxrTMA+qDoEU0ef7/nXVZc7zL5bA1eL8JatAiQZTFkP9
         2xTQwHsppt+/QC7WWQMmC4SnGRXQ0zEMRLyLX2UBIPwaK03CASLIlkjP9BC2uzodTKDt
         vOxg==
X-Gm-Message-State: AOAM531X1eZO6/nb6iDdIQsEALPOSafbTv5K6zAZPcm4Gx9w/LMXDvHZ
	XrmIxpsFCvDW9LWP4mopzWc=
X-Google-Smtp-Source: ABdhPJwNsCxuqEhd5yXAbRuAC5lW4mCRMrzmSRJSBBgLI8ltKiluxcg8U2txtKFdQV0d8kPGciQrsw==
X-Received: by 2002:a17:90a:1784:: with SMTP id q4mr36207945pja.3.1643657439462;
        Mon, 31 Jan 2022 11:30:39 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id q1sm114942pjd.48.2022.01.31.11.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 11:30:38 -0800 (PST)
Date: Tue, 1 Feb 2022 08:30:32 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, realwakka@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: pi433: remove unnecessary new line escape
 sequence characters
Message-ID: <Yfg42KS3sQ8PZmo1@mail.google.com>
References: <YfYtsiKbOXghIN+5@mail.google.com>
 <20220131104020.GI1951@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131104020.GI1951@kadam>

On Mon, Jan 31, 2022 at 01:40:20PM +0300, Dan Carpenter wrote:
> >  	if (device->irq_state[DIO0] == DIO_PACKET_SENT) {
> >  		device->free_in_fifo = FIFO_SIZE;
> > -		dev_dbg(device->dev, "DIO0 irq: Packet sent\n");
> > +		dev_dbg(device->dev, "DIO0 irq: Packet sent");
> 
> Both the old and new code will do the same thing.  You are correct.
> However in terms of style, I believe the preference is to add a newline.
> 
> I don't remember the reasoning behind this.  But a lot of these style
> rules are just decided by consensus.  If you do a
> `git grep -w dev_dbg | grep \;$` then it is 12391 places that add a
> new line and 622 which don't.  Adding a newline is the clear winner.
> 

it makes sense. I will send a different patch adding the newline escapes
instead. 

Thanks heaps! 

Paulo Almeida
