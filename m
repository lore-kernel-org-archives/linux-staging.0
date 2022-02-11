Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133C47E
	for <linux-staging@lists.linux.dev>; Fri, 11 Feb 2022 19:22:46 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id t4-20020a17090a510400b001b8c4a6cd5dso9725772pjh.5
        for <linux-staging@lists.linux.dev>; Fri, 11 Feb 2022 11:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=f1IOy/ZzCK13/sKR3/RKB4aOENTitzg5dSVI621uCks=;
        b=MHYLxLfT8NSuyPtgPycShTFl83VwYb5sqW5qHWLunkJJvZahDcUhCXBOnivWewvjzo
         q3+H54m7CjIcryI9YcFlZONOUfkjPZfwCrSPBKtvzbK9aQ7GNG3B0JlR141Q/pn9b6lJ
         XgmcLUpnbB8LHyD9+87Hterree9e1McCZryUCih8HELKulKXbLADkJb+318LULsIz/D0
         QAzTGLttV20wEeLSsPcAtuVweO5l7eEnyDzopI21s2mXl7A7Tk3Kid4A7T57iPIA40sj
         6Uc2B9T7BpWXUkzn93NfFDHp3nnuTmg2Jnj1Aq4VD4rX66SyipWqOLDJsio01rC5phqk
         TAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=f1IOy/ZzCK13/sKR3/RKB4aOENTitzg5dSVI621uCks=;
        b=ow3Mbrm4cGAtjUjJllp99FsljhfGQE980Qz3eCvpwQiHqjlpjf3u20+dVkzQahMGKm
         7IwXTl/RHhpOtcJfD0EUTKnrC8vGt6g9qO5uo19m42LGUupstuUEiRWo4njga4rPdRYC
         xOZs3XyHg3GJ9tf0B2L124pNio28NayY/m7F1Y/Ku9hBqZ8YQiSdZYj21svsITcgjwj6
         JiCLM4coZF4GW49xvbp7fh+9B/gyvqo3kh6+00smTJobwVoCQTb2jE4V/o8OV1enZSbz
         SfUyiCkD9rnqCVx+zx/7O3BOC7fNTpfkvTsZ7nuhnrfyGa1264161l6LkaRpKqyxRDwH
         6w/g==
X-Gm-Message-State: AOAM532+/HZlSNXryZwsovurLnBG3z4ewVR2X12RGs7u80DPjVxcqEUq
	ZAQ1XOWxxBaRimQYByAJwCs=
X-Google-Smtp-Source: ABdhPJyM5+0Y6t4Rr0lV9MiWHfp5CPdprmx2OUH822mIHo0cvaGZiZ1Z8qFHWs2Qnnxr821WTJLF4w==
X-Received: by 2002:a17:90a:af97:: with SMTP id w23mr1904303pjq.162.1644607366380;
        Fri, 11 Feb 2022 11:22:46 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id l22sm29237357pfc.191.2022.02.11.11.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 11:22:45 -0800 (PST)
Date: Sat, 12 Feb 2022 08:22:40 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, realwakka@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: pi433: add rf69_dbg_hex function
Message-ID: <Yga3gHm0X5UlKuXv@mail.google.com>
References: <YgYZRArwwF7Z1B4f@mail.google.com>
 <20220211142528.GO1951@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220211142528.GO1951@kadam>

thanks for taking the time to review my patch

On Fri, Feb 11, 2022 at 05:25:28PM +0300, Dan Carpenter wrote:
> 
> I feel like this patch is over engineering your debug code.  Is this
> really worthwhile?  If you really prefer the new format that's fine but
> it seems like not necessarily a good use of energy.
> 

After reflecting on it for while, I think that you and Greg are right
not to like the approach taken.

> > +	}
> 
> Instead of printing lineline at a time in a loop, what happens if you
> just print size bytes?  (I honestly don't know because I have never used
> this function before).
> 

It gets truncated as hex_dump_to_buffer prints at most 32 bytes.

thanks,

Paulo Almeida
