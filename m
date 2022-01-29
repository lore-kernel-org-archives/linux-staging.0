Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CDB2CA6
	for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 03:31:06 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id qe6-20020a17090b4f8600b001b7aaad65b9so2092385pjb.2
        for <linux-staging@lists.linux.dev>; Fri, 28 Jan 2022 19:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DgOT1D+Wv4LKuKGK2zVNFgZ5Xa2oIBBVn65t7kpdTTo=;
        b=OA/Rv103HDf2pylvjEkyQP9ofUar4Lt0aP0XUWTG2tV3olpZFn9ODp/bih0QPNyzKt
         zAGGxwgHEj8xf0y7nOlYFhqNnY1CxO81W8irtjqITmACM6UOEHQ2FP4J7dJV1C8ymeT2
         4UWo3vAiLMXfA2dRjX79Y9x50f1nOlLfFTi5hPhZQOIcpdFtMC0HK7m5jV5oDawtEI0Q
         7BHbMXANs4dVnHkhEjX/xVVofZu9DAtYjrom5uRzw1zVxDwNxnVv94aQfmHVNdxzH/ud
         OXyu7ghtmtZBDhf9aiAKwrPsB4CX3c1GB+byQEJjG16dkmelVq6lQhWG4M5cd8AuIcQY
         fMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DgOT1D+Wv4LKuKGK2zVNFgZ5Xa2oIBBVn65t7kpdTTo=;
        b=Ad+C3UGsXkv6Jff273s2vC4NabRMQSVocx7NE4ik12bi1PwtOjuANXIt8eHXIpo1L/
         suAug9H357dlaxoBrihUHZPRkvP5606vpa3GFMZjCwrrO4cED/lNmXFsEtiRjXPmQQS5
         thT9jIVfr8kNwRVBBxG4myQp1jBF1UkILb2Sr791MJXqBBjC1fVibEbZDAtrEGmU3ahR
         lokV4hMtGkMdpApwX8miPeatX+dE23Sq4L2F5exXyhlBLi3UtagcDFMTaybGM3EgYWja
         dmOqBsSwQsBB2T6Ry6xuHG7p/L4csbuJ0Sl8JMPY0ha8yIIWOCsU5nWGpg3ra61qMRje
         1u0g==
X-Gm-Message-State: AOAM533jeUeJAI5WzexRMriaLtwN6+zBEt79Aj5lvEByE/QaSctcMAo8
	Thu6tOy9DIMVDvuCHSD/CXg=
X-Google-Smtp-Source: ABdhPJzoYYmD2WTeVwOsySiwKvXJDBrwyFeE17mhXds8cZqByJzkv8Q00iEa/BP+vcuUZZXrjH49sQ==
X-Received: by 2002:a17:903:31c8:: with SMTP id v8mr11552660ple.76.1643427065697;
        Fri, 28 Jan 2022 19:31:05 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id f22sm9359156pfj.206.2022.01.28.19.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 19:31:05 -0800 (PST)
Date: Sat, 29 Jan 2022 16:30:59 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, realwakka@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] staging: pi433: add debugfs interface
Message-ID: <YfS087tUCqT3JAXY@mail.google.com>
References: <20220124042506.GA7662@mail.google.com>
 <20220124042721.GA8078@mail.google.com>
 <20220126132116.GA1951@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126132116.GA1951@kadam>

On Wed, Jan 26, 2022 at 04:21:16PM +0300, Dan Carpenter wrote:
> Since you're going to have to redo these anyway can you make some
> additional changes?
> ...... 
> 

Hi Dan, thanks for reviewing this patch. I will make those changes 
and submit a new version of the patch shortly.

thanks,

Paulo A.
