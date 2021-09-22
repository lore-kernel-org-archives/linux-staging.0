Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6443FC9
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 09:05:38 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id u8so8990821lff.9
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 02:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=slTV8Z+Iv2BeDlB5S8f95ONxlbcf+1pDh0QE8l9nOEQ=;
        b=i9ybnsQOHqvEQtNO8h8rCxJSYZ2KdpWaRkkklCBkdcnv2uAiGeCZTdps5AZ9IdLD+6
         fUgJEM/xTy+OYkQCWikMkOj1VEz0eGkRqlacxozWV8TgQLnHKbfynB3S0ZZh9EmZMOIB
         kHfKY+x4d+Unto9hAHYs9EbtHAvm2AQb8a8pPuSrAvITP7zONZIJyNcDM7eAj10Axlqy
         /2kg1DlfX3YZlu80orQZy0/Svk2ewGFtIcAj7k89HY1jKl0YIGOoNQ9C0ez4sAyzgH1B
         bYlR+1aj3Z6zWw9QTZMGUwr8zetRnFtxOjxdJAMd7CSXCvjzP3bWJEqtsDF4s3JJzUWQ
         GmWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=slTV8Z+Iv2BeDlB5S8f95ONxlbcf+1pDh0QE8l9nOEQ=;
        b=XUTe2Uk8FHCdxMxlanviqD7Nrvvlk+xgnuDkURv0bStxHe8K0T18RcLYeJOn9cowNW
         XaOjUuzAbdzKf1/cQ8NRihBHohGYdIef0Whsgtgn7Pac1CFI//sOao+CIph/lqHG1KIw
         E8r+VFriEOb3QZcldvwomUFn+fv2o+msrlm++7tsdUHiUZ+pC48IqoA/1AId2/pceVD6
         ZdQZJU6nXa6GJg+RXhJM3OuPaxvyW7iCe8CC63xLzufDoHhPTf4VHzDOwAMKoB9L9aAt
         Rx8807PruX0NnmI/EM9OSJe58lHACqDU382h7d1WlfiX41Ns1Zxuxi0NHKYVVnYZzKEP
         rGYg==
X-Gm-Message-State: AOAM530wNmyUYOBgsIwL/cp9LwNaN2J98j/XBrcgIXiypiX9RBQcx8Le
	3QEDJWtDWP2aNBKoj7ZUHkA=
X-Google-Smtp-Source: ABdhPJwL3StTJaATi8gW/oPBglzRA+pg+wjzoIU2iSmykApHc1N/aLAA8Z8OAG+eKmfCXrr0WzYbbw==
X-Received: by 2002:a05:6512:3a8d:: with SMTP id q13mr11428478lfu.198.1632301535369;
        Wed, 22 Sep 2021 02:05:35 -0700 (PDT)
Received: from [192.168.1.100] ([178.176.79.80])
        by smtp.gmail.com with ESMTPSA id v12sm184574ljp.124.2021.09.22.02.05.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Sep 2021 02:05:34 -0700 (PDT)
Subject: Re: [PATCH v3 3/3] MAINTAINERS: add myself as maintainer of the
 MT7621 PCI controller driver
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-pci@vger.kernel.org
Cc: lorenzo.pieralisi@arm.com, john@phrozen.org, devicetree@vger.kernel.org,
 tsbogend@alpha.franken.de, bhelgaas@google.com, matthias.bgg@gmail.com,
 gregkh@linuxfoundation.org, linux-mips@vger.kernel.org,
 linux-staging@lists.linux.dev, neil@brown.name, linux-kernel@vger.kernel.org
References: <20210922050035.18162-1-sergio.paracuellos@gmail.com>
 <20210922050035.18162-4-sergio.paracuellos@gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <06500d9d-4156-f9df-956c-7306a2984a3e@gmail.com>
Date: Wed, 22 Sep 2021 12:05:22 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210922050035.18162-4-sergio.paracuellos@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.09.2021 8:00, Sergio Paracuellos wrote:

> Add myself as maintainer of the PCie Controlller driver for

     PCIe Controller. :-)

> MT7621 SoCs.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
[...]

MBR, Sergei

