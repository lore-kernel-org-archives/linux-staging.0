Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F11A1C31
	for <linux-staging@lists.linux.dev>; Thu, 30 Mar 2023 08:38:14 +0000 (UTC)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PnGtQ0zQ0z6J9tP;
	Thu, 30 Mar 2023 16:34:22 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 30 Mar
 2023 09:38:06 +0100
Date: Thu, 30 Mar 2023 09:38:05 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
CC: Rob Herring <robh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, "Michael
 Hennerich" <Michael.Hennerich@analog.com>, Jonathan Cameron
	<jic23@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johannes
 Berg <johannes@sipsolutions.net>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Jiri Slaby <jirislaby@kernel.org>, Thierry Reding
	<thierry.reding@gmail.com>, "Jonathan Hunter" <jonathanh@nvidia.com>, Marc
 Zyngier <maz@kernel.org>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-staging@lists.linux.dev>,
	<linux-wireless@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-serial@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/5] iio: adc: ad7292: Add explicit include for of.h
Message-ID: <20230330093805.00003bb4@Huawei.com>
In-Reply-To: <ZCThn87xFr3wGtzP@marsc.168.1.7>
References: <20230329-acpi-header-cleanup-v1-0-8dc5cd3c610e@kernel.org>
	<20230329-acpi-header-cleanup-v1-1-8dc5cd3c610e@kernel.org>
	<ZCThn87xFr3wGtzP@marsc.168.1.7>
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

On Wed, 29 Mar 2023 22:10:55 -0300
Marcelo Schmitt <marcelo.schmitt1@gmail.com> wrote:

> On 03/29, Rob Herring wrote:
> > With linux/acpi.h no longer implicitly including of.h, add an explicit
> > include of of.h to fix the following error:
> > 
> > drivers/iio/adc/ad7292.c:307:9: error: implicit declaration of function 'for_each_available_child_of_node'; did you mean 'fwnode_for_each_available_child_node'? [-Werror=implicit-function-declaration]
> > 
> > Signed-off-by: Rob Herring <robh@kernel.org>  
> 
> Acked-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> 
> Thanks,
> Marcelo
> 
> > ---
> >  drivers/iio/adc/ad7292.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/iio/adc/ad7292.c b/drivers/iio/adc/ad7292.c
> > index a2f9fda25ff3..cccacec5db6d 100644
> > --- a/drivers/iio/adc/ad7292.c
> > +++ b/drivers/iio/adc/ad7292.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/bitfield.h>
> >  #include <linux/device.h>
> >  #include <linux/module.h>
> > +#include <linux/of.h>
> >  #include <linux/regulator/consumer.h>
> >  #include <linux/spi/spi.h>
> >  
> > 
> > -- 
> > 2.39.2
> >   

