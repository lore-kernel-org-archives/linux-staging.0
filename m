Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECEC3FC8
	for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 17:05:58 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id w29so29382559wra.8
        for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 10:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=PY4KsopAnhFuuxcCGlkV29I1qc5kit5PQGjKdrKsIBI=;
        b=PZXQUf5V1LcDI72rtn5I4icEufwVsEW7f3qY0d6NJEyiuv0En6/eUQFnfi7kJapB47
         uVYnaynBcHNYSa99wRNhcKVn1vZzZFo7bKgGc9IBywCBznCF63y2W3f9RGjUgukI3H6G
         YGPnVXQrYUWob+uNPzfDwrPXbubpGM7bdzl8yOuFDjIVIKn1S6A3GQV7LfmkcNPFHLit
         HlYLvOJszVVYXOFxxauLesUxAdq55Vd1AJuhix8LFa2P4rKD0g3vQS/J3uKzH6ab/Kif
         2Xpc/9U0/iimSrPTNMpXF6kM0hAFwQJKZD76QhfNbrFJioIA9iSd2MjcmhtJ0guoFACX
         8x8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PY4KsopAnhFuuxcCGlkV29I1qc5kit5PQGjKdrKsIBI=;
        b=YynyP00QRAvG6XQu1HvbkJlTcfa8G/uk9m7iVac62JIWN8sVpVi567IGVuMr16Uue7
         AbaOyEbFkqVyLAojGedw6M9nKTjtplNV5+Db3F+YavsWt5HdkveCqxFQvvXQHZaIYGj7
         r2e/F9x6SISaXFg5G4RUOIH75ewbuFO3IDEHn6/usfyfUjD431M4PWY1ZdbpUWKji6yq
         6urdA9/gMy0IvWwCv6tuXaqhZfGFFumG6Gqehh4/Zfsd/UXs+SNKks57u3RfAfMu91M1
         wTsxcr6j3Ff1BKqijEpX3gNu+N7f051iMzWs+T3DpBzTuDVr9cpGe43/LWHI7EZqEdU8
         3PTA==
X-Gm-Message-State: AOAM531D8kuQ4B5tm8nnXETg1NmsyPULfxs+pSyyau+M2V38byCXrALg
	G453tVeGluIitUA/DxvLoT4=
X-Google-Smtp-Source: ABdhPJzg2xGoR/EOMzF98e/e3XNtLAJyiGcJrpcpxL1Itovxb7ER/nfMoDcS9i4dXQcnAjdKw6zfnw==
X-Received: by 2002:a05:600c:206:: with SMTP id 6mr3318450wmi.114.1632503156361;
        Fri, 24 Sep 2021 10:05:56 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::cde? ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id r27sm7767173wrr.70.2021.09.24.10.05.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Sep 2021 10:05:55 -0700 (PDT)
Message-ID: <29184a95-c676-79d6-bb9a-88d37d44a80c@gmail.com>
Date: Fri, 24 Sep 2021 19:05:55 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] Remove blank lines and whitespaces
Content-Language: en-US
To: Michael Estner <michaelestner@web.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210924144750.6020-1-michaelestner@web.de>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20210924144750.6020-1-michaelestner@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/24/21 16:47, Michael Estner wrote:
> Removed blank lines and whitespaces to clean up code.
> 
> Signed-off-by: Michael Estner <michaelestner@web.de>
> ---
>   drivers/staging/r8188eu/core/rtw_io.c | 65 ++++++++++-----------------
>   1 file changed, 24 insertions(+), 41 deletions(-)
> 

Hi Michael,

the file rtw_io.c was removed entirely with commit
06c38fef11bc ("staging: r8188eu: remove core/rtw_io.c").

You should work against the latest staging-next tree.

Best regards,
Michael
