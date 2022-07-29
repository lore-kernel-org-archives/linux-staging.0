Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E867A
	for <linux-staging@lists.linux.dev>; Fri, 29 Jul 2022 06:23:13 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id v17so4652517edc.1
        for <linux-staging@lists.linux.dev>; Thu, 28 Jul 2022 23:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=jn7iNHkpfjyvOcSRY1FS0eqnb8a81QxEYqDJzIKy0rg=;
        b=VnPVkgWWYibvER1O6NFyX1pqmFaNRfiduYlMrdDL1OA04YSkzsNvhrM0c9oU3+bmWG
         Oybps67yGl7FcLItPA+I+EtUyu599cgHgTh4burV1ONC3JZFmQfzLfc+Tr5gh0PNzUiD
         9JafgKi+EtG4hRfb+N5Oq70Mb1bm5MreZ6lujTqkOFBkeZTchQ5xQVS2aBtgcbgKuR1/
         Fawhi0MMrmDNxyMFye1m5Cns3+gk2Ae5e1jZmnrtk4v/bwt0hAtQtRGvDjgNXjN8c1My
         TS8VewslcFTbjXkbhaHx8r5behOxYjTHqP10GEx+806xHYyqm7DLGKPBWVzGCHyy19fp
         NCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jn7iNHkpfjyvOcSRY1FS0eqnb8a81QxEYqDJzIKy0rg=;
        b=bU98BQGDcUAtWmeHk/6C9LjTtB/LYATKBXw31eUjy32GB8BaQjLu70XBTXH8iCiVXp
         GcDjN5aqLRJTnSji+ImxEz+NeP6tvtPr5mRJq1XWhnHZkdyN++FQMn0rDX8za6Q9Cwvk
         Exd7u55RjbZ9NYhVNlCyz2wlkd+qwhMVArx3AadW5c7Nl6Pm8WaXEd5e5LdZj74VMphH
         2ZGRAmcAUH+k8y40kiEgMoEYRJ1JYXS+36uLMnqJKt8akW6xXRSHbWxpACEx6mONZFW9
         9iGqo6tCLQB52W6Trqd2owUxM41FRyT3Sar5HHqsvEqC11S9HjndElub6IzRQFfdLnRt
         yOtg==
X-Gm-Message-State: AJIora/7rfnjEyv0ZNL6xiSa/jkjmg7HfeX4l5tB3hg9Xitp+8X2+clO
	QNNtGhOxy9IguLYawBxPelw=
X-Google-Smtp-Source: AGRyM1tXf55v379ZCanytz5h1ko9t5wwHGJa2S8Lwk2iHnQvBdetk7cvhPuE/58cGwUhBYcVeoRFyQ==
X-Received: by 2002:a05:6402:2b8f:b0:43a:66d4:a025 with SMTP id fj15-20020a0564022b8f00b0043a66d4a025mr2082333edb.121.1659075791866;
        Thu, 28 Jul 2022 23:23:11 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2e:6989:9a7f:5736:fb10:795a? (p200300c78f2e69899a7f5736fb10795a.dip0.t-ipconnect.de. [2003:c7:8f2e:6989:9a7f:5736:fb10:795a])
        by smtp.gmail.com with ESMTPSA id w1-20020aa7da41000000b0043a4de1d421sm1839407eds.84.2022.07.28.23.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 23:23:11 -0700 (PDT)
Message-ID: <90a16ffd-5a08-0ed3-280e-bd5c4522525c@gmail.com>
Date: Fri, 29 Jul 2022 08:23:10 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/3] staging: rtl8192u: move debug stuff to its own
 file
Content-Language: en-US
To: Tong Zhang <ztong0001@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, Jakub Kicinski <kuba@kernel.org>,
 Saurav Girepunje <saurav.girepunje@gmail.com>,
 Colin Ian King <colin.king@intel.com>, Nathan Chancellor
 <nathan@kernel.org>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <YuDdHMaB6jWARQzA@kroah.com>
 <20220729035230.226172-1-ztong0001@gmail.com>
 <20220729035230.226172-2-ztong0001@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220729035230.226172-2-ztong0001@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/29/22 05:52, Tong Zhang wrote:
> This is to prepare for moving them to debugfs and fix rmmod warn issue
> when wlan0 is renamed to something else.
> 
> Reviewed-by: Dan Carpenter<dan.carpenter@oracle.com>
> Signed-off-by: Tong Zhang<ztong0001@gmail.com>
> ---

When I applied your first patch I got this hint:

Applying: staging: rtl8192u: move debug stuff to its own file
.git/rebase-apply/patch:399: new blank line at EOF.
+
warning: 1 line adds whitespace errors.

Not really an functional issue...but

By Philipp
