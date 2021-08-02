Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A15A168
	for <linux-staging@lists.linux.dev>; Mon,  2 Aug 2021 13:30:20 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id y12so24489818edo.6
        for <linux-staging@lists.linux.dev>; Mon, 02 Aug 2021 06:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jrreXR6UtcIQ40BKCYv/SEEKLdouMTALz5I4T+6sWrM=;
        b=aNyBU50Us47KWtvrCC7mIgnvgP1OgTGesTZoLa+PBWAv3gHMDiZDNvZj+Czcx7GPQo
         5+nFDcAlRfrcTrD0oHT8CaJY+N7FMojj7eQmDNxFRUw6ef8dIP7vWau6c7R2jQCYQeFj
         GhF2UJprkDEVpPyU5IWGbWZw9ijzhsUw4bU5oNHOrpdp/hB713lgPVbXojCkbciUSMi+
         O8ZkzaaZWqYlIcVp+hZlOs8gF52Q90SZwvMtY8I3A5dC/+jjroyAldAs2M3kcUfM9rOz
         7DhDBcnL5H62xi309FWVrxSAS16oLgepMAw/QTZWCRwEXrAUE1EbW3Y0VefzGvDzVj8/
         lZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jrreXR6UtcIQ40BKCYv/SEEKLdouMTALz5I4T+6sWrM=;
        b=SECG9fwaFcLGR/T6p9GpMyks/bli2gk9dNUW3UmFWpnRnKz9FLT4/msXoZbwTwVeeP
         0E+mopNdnoUBU7mKu5/QyAb8ROFe6isBlUz64N0/2aJ6UzhUn6RDOirwDKVQXm2BwKgv
         wUcPT+o6683Zj3IfoRFnguNDfwFIBnb+tbUwz7DNE+DiVpq0LCFNcti2Jl1F2bLF47d9
         NT6T8j6nRKglDYJgnC0OV2+5R+PyDZ1lTk/HMJHXFGSNFsy6F3N3NWvnKFvZfj0WhNqm
         5n3T2723MhhihRUY4RZ+2i6AM2k4mGueGNMzVitq3dytbbvD1Yht9MHpi6aiQGI4BBSE
         sGkw==
X-Gm-Message-State: AOAM530Yjv/LIsn/5BkNqVUXQ6kaYFnqxCc99h2sQRBM0CEe+t1hah+L
	geNRRwGctAcwbf4fNGRM+f4=
X-Google-Smtp-Source: ABdhPJyWoi3s/QzC/UVBQzWia2WycF5Acx1lqCUh74Zj0If1008XEGMlcCZzdcQ7OGuAXmr5W0pDkw==
X-Received: by 2002:aa7:cb86:: with SMTP id r6mr19113930edt.181.1627911019046;
        Mon, 02 Aug 2021 06:30:19 -0700 (PDT)
Received: from agape.jhs ([5.171.81.207])
        by smtp.gmail.com with ESMTPSA id d9sm6016267edu.19.2021.08.02.06.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 06:30:18 -0700 (PDT)
Date: Mon, 2 Aug 2021 15:30:15 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, hdegoede@redhat.com,
	Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] staging: rtl8723bs: remove unnecessary parentheses
Message-ID: <20210802133015.GA1419@agape.jhs>
References: <cover.1627656773.git.fabioaiuto83@gmail.com>
 <fca83a857ebb158cf395ea31f1834c04402c39e4.1627656773.git.fabioaiuto83@gmail.com>
 <20210802130551.GY1931@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210802130551.GY1931@kadam>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hello Dan,

On Mon, Aug 02, 2021 at 04:05:51PM +0300, Dan Carpenter wrote:
> 
> Please fold patches 2, 3 and 4 together.  It counts as one patch because
> it's "tidying up the condition".
> 
> regards,
> dan carpenter
> 

ok I will next time I'll be submitting a similar cleaning,
they are already in staging-next...

thank you,

fabio
