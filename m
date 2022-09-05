Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A1D28EA
	for <linux-staging@lists.linux.dev>; Mon,  5 Sep 2022 07:07:56 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 4B8B15C00F2;
	Mon,  5 Sep 2022 03:07:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 05 Sep 2022 03:07:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1662361675; x=1662448075; bh=yENjXBdtWJ
	caH4tBUcIo3UAKQ9FokdFeWdfMYGdTTEU=; b=vRxTYi31/Xa7bzYzCfwbzpdTO9
	10fyX3ZCY+XbC06/XOhaCU6iZm3Kr86qdyHWkfQJdpe4I1uUvlzJuC7qxbgteXMq
	4Ez39ReAlYnUf0YT874T3QebyptQIvaGaNcR0aOhbyU2rv4hTVzI311uU2nukXJ3
	G9fyZ4AHfjINk4iAffagVCv9PHEblMdf2h2hR3A4mEI41s7gffb/O+jYt3MwO/ZI
	koBbLNEx0fM/ZYEIo+S8jegbXvIDwhf9Gq213mLx0shcMsJp8zaOzuLKvJ8rxXqN
	wHZTU8knj8i5yWoIEGg5ChyBizdV7UVYH8RdmXWeuXlfa0nUNFqLBjPHcmUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1662361675; x=1662448075; bh=yENjXBdtWJcaH4tBUcIo3UAKQ9Fo
	kdFeWdfMYGdTTEU=; b=Ija5y16QvO2PVCzS1oq8gSGNlfM/Q64B+Ktj9FQVSovJ
	YW/34XAJtjSN0UFtVFS7xL2W9ZYnMVdcKA3xiZYqtNHezGRK5Evj+XahyGx0DvxU
	30/K9oFyzSV7P3n5zqGQb9oYoBYz/Ok3Cty3fKfpcWmpn8dZYyFIHbnI35gOOOls
	OOc6LlHlmMQfNDy8mi6tlWWZytR+7b0gUtRo05vOnSQFpnna/rUQQeoJIzNjPVQm
	50TIDVz7VILJcCoY31ON/imovWmRGCVn55GYKy3Qfyo7VH0DL9KOjNTVihxJo96p
	I6xvZEmxKkVEakBBZzHkfqAV77Enz62dUHBTTaPULg==
X-ME-Sender: <xms:S6AVY7kOrnVmE1Xkp1PLx3VaYmdDWuBJKH-T9zfWCnNoJ3u7CdTR-w>
    <xme:S6AVY-2W2MR5mvWwzVa3Jr8HilvEypw6goCqeTiYyeqxk8Y0j1lmF_Wjhuf5uf3PB
    WmQuZpINOu05w>
X-ME-Received: <xmr:S6AVYxqJrQfmRGErVGc2mZHQF26hXgZsP8AiEOdyhaK9fKUANIMnJcV9PJFpGjZLxn28Gqij3vlUpAjvQZEB_j7D2Cy4dVkp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdelhedgudduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgv
    ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehge
    dvvedvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhroh
    grhhdrtghomh
X-ME-Proxy: <xmx:S6AVYzko7GIrzi2dgzF6A4r6HzeH8-f8JymcKEq24rlmTn7mc6uI4g>
    <xmx:S6AVY50agAnN2RuNc1wKO2er9o_tV_n2HdVOLgre0Xy5gCyQTysVMw>
    <xmx:S6AVYyv_FlPs6uGdNtfStJO5zkW63OdoyiBraKHdmpRFiexyjHf5xw>
    <xmx:S6AVY0TNTv14YALraiPkWQUfkzR2uEuELLt2qbzrBYoZ_UplqHO4ew>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Sep 2022 03:07:54 -0400 (EDT)
Date: Mon, 5 Sep 2022 09:07:51 +0200
From: Greg KH <greg@kroah.com>
To: "Czerwacki, Eial" <eial.czerwacki@sap.com>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"Hammer, Gal" <gal.hammer@sap.com>
Subject: Re: invalid drv data in show attribute
Message-ID: <YxWgR+/jBC/uBkAS@kroah.com>
References: <PAXPR02MB7310E14184AA4389841AE89E817C9@PAXPR02MB7310.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR02MB7310E14184AA4389841AE89E817C9@PAXPR02MB7310.eurprd02.prod.outlook.com>

On Sun, Sep 04, 2022 at 02:37:32PM +0000, Czerwacki, Eial wrote:
> Greetings,
> 
> while working on a driver, I've found a bug that I'm unable to understand.
> I assume that I'm doing something wrong. here is my reduced c file:

Other minor things now that my coffee has kicked in:

> /* modules info */
> #define DEVICE_NAME "vSMP"
> #define DRIVER_LICENSE "GPL v2"
> #define DRIVER_AUTHOR "Eial Czerwacki <eial.czerwacki@sap.com>"
> #define DRIVER_DESC "vSMP hypervisor driver"

For things that you only ever use once, no need for a #define.

> #define DRIVER_VERSION "0.1"

drivers never have versions once they are merged into the kernel tree,
just drop it.

> 
> #define PCI_DEVICE_ID_SAP_FLX_VSMP_CTL 0x1011
> 
> #define ROOT_SYFS_FOLDER "vsmp"
> #define DEVICE_ATTR_NAME(_name_) &dev_attr_##_name_ .attr

That's very very odd, don't do that.  Spell it out so that it makes
sense what is happening, otherwise this looks like a driver-core #define
that I had never known was there.  Turns out it wasn't there :)

> #ifndef sysfs_emit
> #define sysfs_emit sprintf
> #endif // sysfs_emit
> 
> MODULE_LICENSE(DRIVER_LICENSE);
> MODULE_AUTHOR(DRIVER_AUTHOR);
> MODULE_DESCRIPTION(DRIVER_DESC);
> MODULE_VERSION(DRIVER_VERSION);
> 
> #define MAX_LABEL_LEN 81
> 
> struct data {
> 	char version[MAX_LABEL_LEN];
> 	struct pci_dev *pdev;
> 	struct kobject *kobj;

Think about which structure is going to own this data.  You have
pointers to 2 reference counted objects, yet no reference count on this
object.  So who controls the lifespan of it and how?

> };
> 
> static ssize_t version_show(struct device *dev, struct device_attribute *attr,
> 			    char *buf)
> {
> 	struct data *d = dev_get_drvdata(dev);
> 
>  	return sysfs_emit(buf, "%s\n", d->version);
> }
> 
> DEVICE_ATTR_RO(version);
> 
> static int populate_version(struct data *d)
> {
> 	int ret_val;
> 
> 	snprintf(d->version, sizeof(d->version) - 1,
> 		 "%u.%u.%u.%u", 1,2,3,4);
> 
> 	ret_val = sysfs_add_file_to_group(d->kobj, DEVICE_ATTR_NAME(version), NULL);

Just call sysfs_create_file(), don't add a file to a group like this.

If you want a named group, then statically create it ahead of time with
a name, which makes this all much simpler.

In fact, never call any "create_file()" function, use lists of attribute
groups as the driver core handles them automatically for you, no need to
manually add or remove or anything else.  Much simpler and easier for a
driver writer to use instead of having to have the same error handling
logic everywhere.

> 	if (ret_val) {
> 		dev_err(&d->pdev->dev, "Failed to create version entry, error (%d)\n",
> 			ret_val);
> 		return -EINVAL;
> 	}
> 	dev_info(&d->pdev->dev, "version is %s\n", d->version);
> 
> 	return ret_val;
> }
> 
> static const struct pci_device_id vsmp_pci_table[] = {
> 	{ PCI_VDEVICE(SCALEMP, PCI_DEVICE_ID_SAP_FLX_VSMP_CTL), 0, },
> 	{ 0, }, /* terminate list */
> };
> 
> static int vsmp_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
> {
> 	struct data *d;
> 	int ret_val = 0;
> 
> 	d = devm_kzalloc(&pci->dev, sizeof(*d), GFP_KERNEL);
> 	if (IS_ERR(d))
> 		return PTR_ERR(d);
> 
> 	d->pdev = pci;
> 	pci_set_drvdata(pci, d);
> 	d->kobj = kobject_create_and_add(ROOT_SYFS_FOLDER, &d->pdev->dev.kobj);

That's a crazy pointer chain there.

Never add a "raw" kobject to a struct device as you then just broke the
tree and userspace will never know it is there so userspace tools and
libraries can't see it unless they manually walk the sysfs tree (and you
really don't want them doing that.)  With what you did here, this object
is now invisible to libudev so no library will see it :(


> 	if (!d->kobj) {
> 		kfree(d);
> 		dev_err(&d->pdev->dev, "Failed to create vSMP sysfs entry.\n");
> 
> 		return -EINVAL;
> 	}
> 
> 	ret_val = sysfs_create_link(hypervisor_kobj, d->kobj, ROOT_SYFS_FOLDER);

Again, no need to ever create a link here.  symlinks are usually for
pointing to attributes of something (driver, device, etc.) or for when
we have messed up in the past and had to move an object somewhere else
and keep userspace from breaking by adding a link so that tools continue
to work properly.

Don't create links to start with for no good reason.  And if you do,
document the heck out of it so we understand why.

> 	if (ret_val) {
> 		kobject_del(d->kobj);
> 		kfree(d);
> 		dev_err(&d->pdev->dev, "Failed to link obj to hypervisor, error (%d)\n", ret_val);
> 
> 		return ret_val;
> 	}
> 
> 	populate_version(d);

No error handling :)

thanks,

greg k-h
