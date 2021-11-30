Received: from smtprelay.hostedemail.com (smtprelay0141.hostedemail.com [216.40.44.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221D72C9D
	for <linux-staging@lists.linux.dev>; Tue, 30 Nov 2021 10:46:20 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave02.hostedemail.com (Postfix) with ESMTP id AA56A1814EA7D
	for <linux-staging@lists.linux.dev>; Tue, 30 Nov 2021 01:17:56 +0000 (UTC)
Received: from omf13.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay05.hostedemail.com (Postfix) with ESMTP id C0DFC184B2559;
	Tue, 30 Nov 2021 01:17:48 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf13.hostedemail.com (Postfix) with ESMTPA id DFFEB200027C;
	Tue, 30 Nov 2021 01:17:39 +0000 (UTC)
Message-ID: <51f8bfafb7543098a0f6274f6b8dd61446f3fda5.camel@perches.com>
Subject: Re: [PATCH] staging: replace snprintf with sysfs_emit
From: Joe Perches <joe@perches.com>
To: davidcomponentone@gmail.com, TheSven73@gmail.com
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yang Guang <yang.guang5@zte.com.cn>, Zeal
 Robot <zealci@zte.com.cn>
Date: Mon, 29 Nov 2021 17:17:45 -0800
In-Reply-To: <21e2111f6c2590ac24ad15d39e87160f9425045b.1638186054.git.yang.guang5@zte.com.cn>
References: 
	<21e2111f6c2590ac24ad15d39e87160f9425045b.1638186054.git.yang.guang5@zte.com.cn>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.90
X-Stat-Signature: n6fdcdyytuxaoqnbeaxs3gkugnpmqdpq
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: DFFEB200027C
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+mAvjVQPrIAu92Rvh7Dcxa0Fxl70E2He8=
X-HE-Tag: 1638235059-32403

On Tue, 2021-11-30 at 08:07 +0800, davidcomponentone@gmail.com wrote:
> From: Yang Guang <yang.guang5@zte.com.cn>
> 
> coccinelle report:
> ./drivers/staging/fieldbus/dev_core.c:73:8-16:
> WARNING: use scnprintf or sprintf
> 
> Use sysfs_emit instead of scnprintf or sprintf makes more sense.

Please convert all the show functions and not just 1 of the 6 possible
cases.

> diff --git a/drivers/staging/fieldbus/dev_core.c b/drivers/staging/fieldbus/dev_core.c
[]
> @@ -70,7 +70,7 @@ static ssize_t card_name_show(struct device *dev, struct device_attribute *attr,
>  	 * card_name was provided by child driver, could potentially be long.
>  	 * protect against buffer overrun.
>  	 */
> -	return snprintf(buf, PAGE_SIZE, "%s\n", fb->card_name);
> +	return sysfs_emit(buf, "%s\n", fb->card_name);
>  }
>  static DEVICE_ATTR_RO(card_name);
>  

---
 drivers/staging/fieldbus/dev_core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/fieldbus/dev_core.c b/drivers/staging/fieldbus/dev_core.c
index 5aab734606eae..9c85bf87a8d7f 100644
--- a/drivers/staging/fieldbus/dev_core.c
+++ b/drivers/staging/fieldbus/dev_core.c
@@ -28,7 +28,7 @@ static ssize_t online_show(struct device *dev, struct device_attribute *attr,
 {
 	struct fieldbus_dev *fb = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%d\n", !!fb->online);
+	return sysfs_emit(buf, "%d\n", !!fb->online);
 }
 static DEVICE_ATTR_RO(online);
 
@@ -39,7 +39,7 @@ static ssize_t enabled_show(struct device *dev, struct device_attribute *attr,
 
 	if (!fb->enable_get)
 		return -EINVAL;
-	return sprintf(buf, "%d\n", !!fb->enable_get(fb));
+	return sysfs_emit(buf, "%d\n", !!fb->enable_get(fb));
 }
 
 static ssize_t enabled_store(struct device *dev, struct device_attribute *attr,
@@ -70,7 +70,7 @@ static ssize_t card_name_show(struct device *dev, struct device_attribute *attr,
 	 * card_name was provided by child driver, could potentially be long.
 	 * protect against buffer overrun.
 	 */
-	return snprintf(buf, PAGE_SIZE, "%s\n", fb->card_name);
+	return sysfs_emit(buf, "%s\n", fb->card_name);
 }
 static DEVICE_ATTR_RO(card_name);
 
@@ -79,7 +79,7 @@ static ssize_t read_area_size_show(struct device *dev,
 {
 	struct fieldbus_dev *fb = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%zu\n", fb->read_area_sz);
+	return sysfs_emit(buf, "%zu\n", fb->read_area_sz);
 }
 static DEVICE_ATTR_RO(read_area_size);
 
@@ -88,7 +88,7 @@ static ssize_t write_area_size_show(struct device *dev,
 {
 	struct fieldbus_dev *fb = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%zu\n", fb->write_area_sz);
+	return sysfs_emit(buf, "%zu\n", fb->write_area_sz);
 }
 static DEVICE_ATTR_RO(write_area_size);
 
@@ -116,7 +116,7 @@ static ssize_t fieldbus_type_show(struct device *dev,
 		break;
 	}
 
-	return sprintf(buf, "%s\n", t);
+	return sysfs_emit(buf, "%s\n", t);
 }
 static DEVICE_ATTR_RO(fieldbus_type);
 


