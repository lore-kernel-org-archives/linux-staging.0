Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4327D1FC6
	for <linux-staging@lists.linux.dev>; Tue, 12 Apr 2022 16:08:29 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id 21so9752291edv.1
        for <linux-staging@lists.linux.dev>; Tue, 12 Apr 2022 09:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BxIANWtTHyLaMzBOBDwW4uFwacwPEAMR+3BbQd3H0Yc=;
        b=Octrr/nWzS3t8PK5jXtNHYjE/qWyqvSpvbq6n9WwGfYF+XwATJ6FOCl0fzvobGleLK
         7goyC0U3JGOyrxDkw4030lxH22iSbbZmC+G4u9tXfci1dQObveOEamGS8MUQazeJzR0h
         4om2xUJHJRTj/8wwmHqYnYJd0e01jbcKDRIyu3TGfum84yzbMtrIlqo946uLUZeY/rre
         he1m51OO6fYSIo8zEnthuWgkCQ+hmSJT8bgd+Tpg8kaz4gzDXE74NNjor0Y+XiAcDRTF
         rypTt7fuC89jHMW+yFsSObgTAw43eU01v2OByaG1b984yLw+lRXGka4NpUF4pCY6JCYe
         iQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BxIANWtTHyLaMzBOBDwW4uFwacwPEAMR+3BbQd3H0Yc=;
        b=GGzT1Ch3dRh5tB8LIuxeo9NQtcv9OtBalDVAQj7iL7OZoa8Y+pw9vXna1H14JYomHq
         L+V2vNOJ3qGejIr69ETXNrm1EhGXZCAW5Hza5fjb8lHd8A65biOdPbJdSy1GXhPqk0Qe
         jrfGAWIZmTzwYxiZMou8Ylr143VFHCv1LlBVKJIT5Z9FilE9m4KZiwUNUysEfF4RrU9n
         y/EzOSH8sYnYC2SpqtqehRx8Pt16McWVcv+WvPokVt2Kc9vOWHW5s9H2/fM2SxN6sVzP
         8k08VQ46G+JjiDtpAcqmzW2GcjzRxAvrtiYMvLwo+czMzBh/dm/qsKOYLVQsFLl/Z/aB
         s8Gg==
X-Gm-Message-State: AOAM532jffNl8kj+B8xHlVhTngQomBkpCVoWt8M7Lb+eIFlw8FyeNKt3
	kWWcjmFaNwzOhomwjrMf7/s1P3+j0Fo=
X-Google-Smtp-Source: ABdhPJyZ/T7Rgd0BXte+iXG4x5G2LGDskFXuelLSrHY9jGVD1N8SEmHlvpoyn3STAtTNvtVPwnOYaA==
X-Received: by 2002:aa7:cad3:0:b0:410:b188:a49a with SMTP id l19-20020aa7cad3000000b00410b188a49amr39244738edt.416.1649779707514;
        Tue, 12 Apr 2022 09:08:27 -0700 (PDT)
Received: from leap.localnet (host-82-60-208-254.retail.telecomitalia.it. [82.60.208.254])
        by smtp.gmail.com with ESMTPSA id p24-20020a1709061b5800b006e88dfea127sm2938296ejg.3.2022.04.12.09.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 09:08:26 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Straube <straube.linux@gmail.com>, Vihas Makwana <makvihas@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [PATCH v2 0/7] drop some unnecessary wrappers
Date: Tue, 12 Apr 2022 18:08:24 +0200
Message-ID: <3134226.AJdgDx1Vlc@leap>
In-Reply-To: <20220412151529.GF3293@kadam>
References: <20220411102136.14937-1-makvihas@gmail.com> <3484215.R56niFO833@leap> <20220412151529.GF3293@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On marted? 12 aprile 2022 17:15:29 CEST Dan Carpenter wrote:
> On Tue, Apr 12, 2022 at 11:53:42AM +0200, Fabio M. De Francesco wrote:
> > I didn't suggest a re-write of the commit messages.
> 
> Yes.  That's the problem.  If you want to complain about a commit
> message then you *should* suggest how you would re-write it.  Otherwise
> how are we supposed to read your mind?

Ah, sorry. I had missed that you were asking for a re-write (literally).

Here it is a sort of diff on Vihas' patch:

- [PATCH v2 1/7] staging: r8188eu: drop unnecessary wrapper _rtw_free_cmd_priv
+ [PATCH v2 1/7] staging: r8188eu: drop unnecessary helper _rtw_free_cmd_priv()

- Drop unnecessary wrapper _rtw_free_cmd_priv and move its logic to
- rtw_free_cmd_priv.
+ Drop unnecessary helper (wrapped function) _rtw_free_cmd_priv() and
+ move its code to the wrapper rtw_free_cmd_priv().

> > I just pointed out that those messages are formally inaccurate but
> > that these kinds of small formal inaccuracies
> 
> I'm so puzzled but what you mean here.  There were no "small formal
> inaccuracies".  The patch removed unnecessary wrappers exactly as
> described.  

The patch removed unnecessary helpers.

> Anyway, I haven't seen your proposed commit message so I
> can't say.
> 
> regards,
> dan carpenter

Thanks,

Fabio M. De Francesco 




