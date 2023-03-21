Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D62C952;
	Tue, 21 Mar 2023 16:19:44 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id ek18so61889958edb.6;
        Tue, 21 Mar 2023 09:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679415582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B6iMXpkdTBzAvk0Bh7ViMsoVWjT2+jjmNi/B2I7tj10=;
        b=avbUlHQu5Bqw3de3EPureIEvBQCp716UugSanvkDNN9xp2NVjNS6nzLrLlmaoMIE3x
         94xIgxta3uQRCTZ7WkuyR5iCblzmV5q9nWZyIILY8KQyEmtSFKSKdngqTnah7S0R593f
         m5QTlzLpsasw32na6cZTZ0W93ExtG43F7oaLLypTgZFCiRWzzBtzj5AmuxBGh2dmAWUF
         tMNGBrLn6BAIXz3QIHI05H5Nq1Bk01NKrd59ZaypfPoPbOW4GFBYKNSz1GICMNtw78zb
         lJZ7xINyAP6J+7IAF4ZmwR2r6Kd3hqimyPuiPrsjNZe/z8GXN+wxCCrDIEzJN5qqSAJk
         U1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679415582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B6iMXpkdTBzAvk0Bh7ViMsoVWjT2+jjmNi/B2I7tj10=;
        b=4v4e7KATXIlh+Ut9SuyzGIpsOvlnyHMRcLUDF6CkVycB3IYycgii6YrYFj5qdqb7t3
         /TFKlOVAAs6SQdDArQ8VRsNtgBKuuoSpAypZayUBZDMNlwvEXHeFw+QA9U7NZdr2Uztb
         M/43DsQR1zKZ3yj6Q00vBXdURAmzl8TW4Ren49+Zc9VyaYypuOosbbPDiBGhxpBSa5JS
         geqfLtWz84rYJ+HH9yyHgXRGjKDCUzTdj6W/NEcrTd7IU21o48QQ+c/JO4xtB2jcPRJf
         BWDeCM3LUfAXI9P761x5DfkONxP/XeZTXcGDPRb2wI+Ttce6WvAWL/Q481c7UVqqQyT/
         iCtw==
X-Gm-Message-State: AO0yUKWvYuVnkG3tP3agylwi8q2vbBSwzu2lUKUQ0FCsHItKLIG8PiIW
	jVsz6SfVD2F5CtL02csabA0=
X-Google-Smtp-Source: AK7set9p03aB4xAlmTjjUmP38B+MsSpdkCnEx0PZ2gqZUecs0e6I5KszVMjC/DocweeV5Lxwjjv98Q==
X-Received: by 2002:a17:907:2059:b0:8b1:bab0:aa3d with SMTP id pg25-20020a170907205900b008b1bab0aa3dmr3470462ejb.8.1679415582370;
        Tue, 21 Mar 2023 09:19:42 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id rk28-20020a170907215c00b00933b38505f9sm3415222ejb.152.2023.03.21.09.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 09:19:41 -0700 (PDT)
Date: Tue, 21 Mar 2023 21:19:27 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: fix line ending with '('
Message-ID: <ZBnZD5alylOgjhYd@khadija-virtual-machine>
References: <ZBhNOkQbG4ygNF98@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBhNOkQbG4ygNF98@khadija-virtual-machine>

On Mon, Mar 20, 2023 at 05:10:40PM +0500, Khadija Kamran wrote:
> Splitting function header to multiple lines because of 80 characters per
> line limit, results in ending the function call line with '('.
> This leads to CHECK reported by checkpatch.pl
> 
> Move the first parameter right after the '(' in the function call line.
> Align the rest of the parameters to the opening parenthesis.
> 
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---
>  drivers/staging/greybus/audio_topology.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
> index 62d7674852be..08e6a807c132 100644
> --- a/drivers/staging/greybus/audio_topology.c
> +++ b/drivers/staging/greybus/audio_topology.c
> @@ -24,9 +24,8 @@ struct gbaudio_ctl_pvt {
>  	struct gb_audio_ctl_elem_info *info;
>  };
> 
> -static struct gbaudio_module_info *find_gb_module(
> -					struct gbaudio_codec_info *codec,
> -					char const *name)
> +static struct gbaudio_module_info *find_gb_module(struct gbaudio_codec_info *codec,
> +						  char const *name)
>  {
>  	int dev_id;
>  	char begin[NAME_SIZE];
> --
> 2.34.1
>

Hey Outreachy Mentors,

Kindly take a look at this patch and let me know if I should wait for
the response on this patch or submit another patch.

Thank you for your time.
Regards,
Khadija

