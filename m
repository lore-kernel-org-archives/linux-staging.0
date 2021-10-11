Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12A22C81
	for <linux-staging@lists.linux.dev>; Mon, 11 Oct 2021 17:11:17 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id k23-20020a17090a591700b001976d2db364so455610pji.2
        for <linux-staging@lists.linux.dev>; Mon, 11 Oct 2021 10:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:content-language:in-reply-to:content-transfer-encoding;
        bh=P4aNo86fMjB1KMvjzw8IEeEhKUvCd9T+22q7Tj97MmM=;
        b=FXxAQatKifnX4nNDqMF8tTVTtWzMm6uothRZr68n8AoezLTxYZ/5F+svzhy30HXVCK
         Qum4CyMOhuhRJN1NZup6h1Zl33CLQKOlsxVLZiCA2zksiNx9AewymLACIBbqAkrwprwK
         xzWZP+M8t2ahtS71d3z18TeUVgA+zNDPWoTVsnRcZCkwbFr5nXYThI0Zdu6zAt70qxHA
         w8kXEIwWlZK7vN5SxieRrhB840chHg4yslW7oU5tccUpR+QKAiuFJ3rHnaVRMMqsGXis
         2UW596Zcd4CgDa81Ks2SnSRVUkgBu30KpakrQ/iFnofEJJNk3122i34tRPKzFyiwXL6I
         SYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:content-language:in-reply-to
         :content-transfer-encoding;
        bh=P4aNo86fMjB1KMvjzw8IEeEhKUvCd9T+22q7Tj97MmM=;
        b=G0naq2usLC0ZWN1guwi7JkWHWfQKLkVDTLGEzvrArCzCYeR2tKQarLTStwxNeuOWH9
         6qzFw/WSaLBiZx+bQ167FpteJFebrllwtLuV5RfACKbL6vVnrs9SD7yFPAfA3aaRTWS+
         avtPtH/mqaSfTWAyHu8qTB6rNoM0JQFAxWogP9AwEECAMSgG/74wiFc89aqx6zPEqrgo
         rrggpkFUSlWJoWHc+1csN2csw0+wo+5QK6AXtpmp78mZFb1h7jYaqlShdJYQpQ5HGm0G
         PWwF0yc9bYxXgk9ab8NesOIYfj5IjOc+FyBs5u1MSIHnH6QIy+f0AJH0+YJlt6icygnE
         VGbA==
X-Gm-Message-State: AOAM530j/N4AxSrE3avs2hnTWtcXefannwApqq47YMzHsMgHlySLpX/6
	CBRibGlmr31Lb6juTB2fAco=
X-Google-Smtp-Source: ABdhPJyB9/tac+id4VCRZuGmj0tRUGHdpNA3WxC7VOk1rU/igTEQKFqK2r1v7I3LYIpoMAaU+ZAWcA==
X-Received: by 2002:a17:90b:3b8e:: with SMTP id pc14mr212531pjb.180.1633972277130;
        Mon, 11 Oct 2021 10:11:17 -0700 (PDT)
Received: from [192.168.1.14] ([223.230.99.151])
        by smtp.gmail.com with ESMTPSA id g17sm5685745pfu.22.2021.10.11.10.11.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 10:11:16 -0700 (PDT)
Message-ID: <bdc8c280-534d-5de0-050f-2dc3db2e41d0@gmail.com>
Date: Mon, 11 Oct 2021 22:41:12 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH] staging: rtl8723bs: hal: remove if condition which is
 always false
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>, saurav.girepunje@hotmail.com,
 gregkh@linuxfoundation.org, marcocesati@gmail.com, lee.jones@linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <YWKXKGuA/Io9sEjf@user> <YWLFf1zPvK9gz+7+@agape.jhs>
 <9dca9f7e-f987-5be5-9523-7dd08c2b364e@gmail.com>
 <20211011104141.GP2083@kadam>
From: Saurav Girepunje <saurav.girepunje@gmail.com>
Content-Language: en-GB
In-Reply-To: <20211011104141.GP2083@kadam>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/10/21 4:11 pm, Dan Carpenter wrote:
> Yep.  And please go through the function and clean up all the references
> to max_rf_path.  Change the "max_rf_path = 0" to 1 and delete the other
> assignment.  Delete the comments about "max_rf_path == 2".
> 
> regards,
> dan carpenter
> 

Yes, Is it good if I send 2 patches one to remove "if condition which is always 
false" and another one to "clean-up all the references to max_rf_path" on a single
patch series. 

Regards,
Saurav 
