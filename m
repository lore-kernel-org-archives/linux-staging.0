Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87A51C31
	for <linux-staging@lists.linux.dev>; Thu, 30 Mar 2023 08:38:23 +0000 (UTC)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PnGx448Glz6J7dB;
	Thu, 30 Mar 2023 16:36:40 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 30 Mar
 2023 09:38:20 +0100
Date: Thu, 30 Mar 2023 09:38:20 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Rob Herring <robh@kernel.org>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Marcelo Schmitt <marcelo.schmitt1@gmail.com>, Lars-Peter Clausen
	<lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan
 Cameron <jic23@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johannes Berg <johannes@sipsolutions.net>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jiri Slaby
	<jirislaby@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan
 Hunter <jonathanh@nvidia.com>, "Marc Zyngier" <maz@kernel.org>,
	<linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-staging@lists.linux.dev>, <linux-wireless@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/5] staging: iio: resolver: ad2s1210: Add explicit
 include for of.h
Message-ID: <20230330093820.0000639d@Huawei.com>
In-Reply-To: <20230329-acpi-header-cleanup-v1-2-8dc5cd3c610e@kernel.org>
References: <20230329-acpi-header-cleanup-v1-0-8dc5cd3c610e@kernel.org>
	<20230329-acpi-header-cleanup-v1-2-8dc5cd3c610e@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected

On Wed, 29 Mar 2023 16:20:43 -0500
Rob Herring <robh@kernel.org> wrote:

> With linux/acpi.h no longer implicitly including of.h, add an explicit
> include of of.h to fix the following error:
> 
> drivers/staging/iio/resolver/ad2s1210.c:706:21: error: implicit declaration of function 'of_match_ptr' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/staging/iio/resolver/ad2s1210.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
> index e4cf42438487..eb364639fa58 100644
> --- a/drivers/staging/iio/resolver/ad2s1210.c
> +++ b/drivers/staging/iio/resolver/ad2s1210.c
> @@ -7,6 +7,7 @@
>  #include <linux/types.h>
>  #include <linux/mutex.h>
>  #include <linux/device.h>
> +#include <linux/of.h>
>  #include <linux/spi/spi.h>
>  #include <linux/slab.h>
>  #include <linux/sysfs.h>
> 

